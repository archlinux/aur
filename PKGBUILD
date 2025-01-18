# Maintainer: Daniël van de Giessen <aur@dvdgiessen.nl>
_pkgname=dbus-app-launcher
pkgname=$_pkgname-bin
pkgver=0.1.1.0
pkgrel=1
pkgdesc="Simple app launcher for D-Bus"
arch=('x86_64')
url="https://github.com/DvdGiessen/dbus-app-launcher"
license=("MIT")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::$url/releases/download/v$pkgver/$_pkgname-linux-$CARCH-static"
		"https://raw.githubusercontent.com/DvdGiessen/dbus-app-launcher/refs/tags/v$pkgver/LICENSE"
		'nl.dvdgiessen.dbusapplauncher.service')
sha256sums=('c194b3fdd1e25a12f7ebf1c7e27349c04ec7fa506dd799588c2907df7f2df658'
			'a3d51f53d30e110dc655f88d5afe7757e13fa81cdce12cff4ba35c5003cd8dc1'
			'bdf13de2547f626ff797070f493999577b9f499d72e904b5d7801e92d11b0387')

package() {
	install -D -m755 "$_pkgname" -t "$pkgdir/usr/bin/"
	install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
    install -D -m644 nl.dvdgiessen.dbusapplauncher.service -t "$pkgdir/usr/share/dbus-1/services/"
}
