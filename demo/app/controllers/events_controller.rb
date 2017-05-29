class EventsController < ApplicationController
	#GET /event/index
	#GET /events
	def index
		@events = Event.all
	end

	def show
  		@event = Event.find(params[:id])
	end

	def new
  		@event = Event.new
	end
	### POST /event/create
	def create
	  @event = Event.new(event_params)
	  @event.save

	  redirect_to :action => :index  # tell browser HTTP code :303
	end

	def edit
  		@event = Event.find(params[:id])
	end
	
	def update
  		@event = Event.find(params[:id])
  		@event.update(event_params)

  		redirect_to :action => :show, :id => @event
	end

	def destroy
	  @event = Event.find(params[:id])
	  @event.destroy

	  redirect_to :action => :index
	end

	private

	def event_params
  		params.require(:event).permit(:name, :description)
	end
end
