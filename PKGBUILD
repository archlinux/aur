# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=mattercontrol-plugins
_pkgname=MatterControl
pkgver=1.6.2
pkgrel=1
pkgdesc="Closed source plugins for MatterControl"
arch=("i386" "x86_64")
license=('custom')
url="http://www.mattercontrol.com"
depends=('mattercontrol')
provides=('mattercontrol-plugins')
source=("MatterControlSetup-1.6.2.tar.gz::https://mattercontrol.appspot.com/downloads/development/ag9zfm1hdHRlcmNvbnRyb2xyQQsSB1Byb2plY3QYgICAiOCSzAsMCxINUHVibGljUmVsZWFzZRiAgIDAv6GECgwLEgZVcGxvYWQYgICAoMSOgAoM")
sha256sums=('63757def7d1d880f67cd72107b3df5c2d0cad2242fb540f48264b2fb4f2b05f8')

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
	cp TcpipDriver.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp X3GDriver.dll* "$pkgdir/usr/lib/mattercontrol/"

	# Libraries
	cp EngineIoClientDotNet.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp SocketIoClientDotNet.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp WebSocket4Net.dll* "$pkgdir/usr/lib/mattercontrol/"

}
