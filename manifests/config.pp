define tmux::config(
	$source = 'normal',
	$target = '/root/.tmux.conf',
	$owner  = 'root',
	$group  = 'root'
){
	require ::tmux
	file{ $name:
		path => $target,
		source => $source ? {
			'normal' => [
				"puppet:///modules/site/tmux/${::fqdn}/${name}",
				"puppet:///modules/site/tmux/${name}",
				"puppet:///modules/site_tmux/${::fqdn}/${name}",
				"puppet:///modules/site_tmux/${name}",
				"puppet:///modules/tmux/normal" ],
			default => $source
		},
		owner => $owner,
		group => $group,
		mode => "0644',
  	}
}
