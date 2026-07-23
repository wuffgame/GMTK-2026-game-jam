extends Node

@onready var label: Label = $counter

const START_TIME: float = 10.0
var time_left: float = START_TIME

func _process(delta: float) -> void:
	time_left -= delta
	
	if time_left <= 0:
		$EXPLOSION.visible = true
		$EXPLOSION.play("default")
		await $EXPLOSION.animation_finished
		$EXPLOSION.visible = false
		time_left = START_TIME
	
	label.text = "%.2f" % time_left
