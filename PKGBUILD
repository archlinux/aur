# Maintainer: surefire@cryptomile.net
pkgname=pulseaudio-bluetooth-a2dp-gdm-fix
pkgver=0.1
pkgrel=1
pkgdesc="Unload bluetooth modules from gdm instance of pulseaudio. Fixes availability a2dp profile of bluetooth headset"
url="https://wiki.archlinux.org/index.php/Talk:Bluetooth_headset#GDMs_pulseaudio_instance_captures_bluetooth_headset"
arch=(any)
license=('unknown')
depends=('gdm' 'pulseaudio-bluetooth')
source=('default.pa')
md5sums=('b44e302eb9c156ba2f88d152b5598dbb')

package() {
	_gdm_home="${pkgdir}/var/lib/gdm"

	install -dm1770 -o 120 -g 120 "${_gdm_home}"
	install -dm0700 -o 120 -g 120 "${_gdm_home}/.config/pulse"

	install -m0640 -o 120 -g 120 -t "${_gdm_home}/.config/pulse" default.pa
}
