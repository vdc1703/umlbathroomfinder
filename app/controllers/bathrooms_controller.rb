class BathroomsController < ApplicationController
  
  def show
    @bathroom = Bathroom.friendly.find(params[:id])
  end
  
  def new
    @bathroom = Bathroom.new
  end
  
  def create
    @floor = Floor.find(params[:floor_id])
    @bathroom = @floor.bathrooms.create(bathroom_params)
    if @bathroom.save
      redirect_to @floor
    else
      redirect_to edit_floor_path(@floor), :flash => { :danger => "Please make sure form is valid" }
    end
  end
  
  def edit
    @bathroom = bathroom.friendly.find(params[:id])
  end
  
  private
  
    def bathroom_params
      params.require(:bathroom).permit(:title, :picture, :coord, :shape)
    end
end
