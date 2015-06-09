# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=concalc
pkgver=0.9.3
pkgrel=1
pkgdesc="Concalc is a calculator for the Linux console"
arch=('i686' 'x86_64')
url="http://extcalc-linux.sourceforge.net/concalcdescr.html"
license=('GPL')
source=(http://downloads.sourceforge.net/extcalc-linux/$pkgname-$pkgver.tar.gz)
md5sums=('802f7753ef3f0141c5607b52d7ceb4bd')

build() {
	cd "$srcdir/$pkgname-$pkgver/src"
	g++ -Os -s concalc.cpp global.cpp -o concalc
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 src/concalc $pkgdir/usr/bin/concalc
	install -Dm644 man/concalc.1.gz $pkgdir/usr/share/man/man1/concalc.1.gz
}
