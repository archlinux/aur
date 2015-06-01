# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=html-xml-utils
pkgver=6.9
pkgrel=1
pkgdesc="A number of simple utilities for manipulating HTML and XML files."
arch=(i686 x86_64)
url="http://www.w3.org/Tools/HTML-XML-utils/"
license=('custom')
source=("http://www.w3.org/Tools/HTML-XML-utils/$pkgname-$pkgver.tar.gz")
sha256sums=('9cf401dc84ca01752adf1f2d9862c4f227bb089504ed9d03d7fd40603e87fab2')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
