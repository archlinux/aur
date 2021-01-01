pkgname=duckclient
pkgver=5.7.0
pkgrel=1
pkgdesc="Standalone version of the MUCK/MUSH/MUX/MOO client for chrome."
arch=('x86_64')
url="www.duckclient.com"
license=('custom')
source=("http://duckclient.com/downloads/DuckClient-$pkgver-linux-x64.zip"
	"$pkgname"
	"$pkgname.desktop")
md5sums=('e7ec4a23284f7a1db2113c4d56505364'
         'eaaa57848431e81987b34baccc678d10'
         '28f409026d5b12f0f947e1b690642156')
package() {
	cd "$srcdir/DuckClient-$pkgver-linux-x64"
	install -d "$pkgdir/opt/duckclient"
	cp -a . "$pkgdir/opt/$pkgname"
	chmod -R 755 "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "duckclient-16.png" "$pkgdir/usr/share/pixmaps/duckclient.png"
	install -Dm644 "license.html" "$pkgdir/usr/share/licenses/$pkgname/license.html"
}
