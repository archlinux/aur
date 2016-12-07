# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=mattercontrol-plugins
_pkgname=MatterControl
pkgver=1.6.0
pkgrel=1
pkgdesc="Closed source plugins for MatterControl"
arch=("i386" "x86_64")
license=('custom')
url="http://www.mattercontrol.com"
depends=('mattercontrol')
provides=('mattercontrol-plugins')
source=("MatterControlSetup-1.6.0.tar.gz::https://mattercontrol.appspot.com/downloads/development/ag9zfm1hdHRlcmNvbnRyb2xyQQsSB1Byb2plY3QYgICAiOCSzAsMCxINUHVibGljUmVsZWFzZRiAgIDA0_6ACgwLEgZVcGxvYWQYgICAwJ_IhQoM")
sha256sums=('0a0ce90660aa9f7a647b687adc76fdd3225f1ab438f3c80fa4cd1c4f842e56e4')

build() {
	cd "${srcdir}"
	ar -x "mattercontrol-1.6/mattercontrol-1.6.deb"
	tar -xvf data.tar.xz
}

package() {
	cd "${srcdir}/usr/lib/MatterControl"
	install -d "$pkgdir/usr/lib/mattercontrol/"

	# Plugins
	cp CloudServices.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp MarlinFirmwareUpdatePlugin.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp MatterControlAuth.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp Mono.Nat.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp PictureCreator.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp PrintNotifications.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp X3GDriver.dll* "$pkgdir/usr/lib/mattercontrol/"

	# Libraries
	cp EngineIoClientDotNet.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp Net3dBool.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp SocketIoClientDotNet.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp WebSocket4Net.dll* "$pkgdir/usr/lib/mattercontrol/"

}
