# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=html-xml-utils
pkgver=7.0
pkgrel=1
pkgdesc='A number of simple utilities for manipulating HTML and XML files.'
arch=('i686' 'x86_64')
url='http://www.w3.org/Tools/HTML-XML-utils/'
license=('W3C')
depends=('curl')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('e7d30de4fb4731f3ecd4622ac30db9fb82e1aa0ab190ae13e457360eea9460b0')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
