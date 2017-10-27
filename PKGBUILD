# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=mattercontrol-plugins
_pkgname=MatterControl
pkgver=1.7.5
pkgrel=1
pkgdesc="Closed source plugins for MatterControl"
arch=("i386" "x86_64")
license=('custom')
url="http://www.mattercontrol.com"
depends=('mattercontrol')
provides=('mattercontrol-plugins')
_buildtoken="ag9zfm1hdHRlcmNvbnRyb2xyQQsSB1Byb2plY3QYgICAiOCSzAsMCxINUHVibGljUmVsZWFzZRiAgIDg8dSdCgwLEgZVcGxvYWQYgICA4NfmjQoM"
source=("MatterControlSetup-$pkgver.deb::https://mattercontrol.appspot.com/downloads/development/$_buildtoken")
sha256sums=('1e594c239a657ef9d92caa56b34c696910055913b71ef64a05ec1fb8830a084b')

build() {
	cd "${srcdir}"
	ar -x "MatterControlSetup-$pkgver.deb"
	tar -xvf data.tar.xz
}

package() {
	cd "${srcdir}/usr/lib/mattercontrol"
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
