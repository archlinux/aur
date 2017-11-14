# Maintainer: matoro <throwaway19587@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=html-xml-utils
pkgver=7.3
pkgrel=1
pkgdesc='A number of simple utilities for manipulating HTML and XML files.'
arch=('i686' 'x86_64')
url='http://www.w3.org/Tools/HTML-XML-utils/'
license=('W3C')
depends=('curl')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('945db646dd4d0b31c4b3f70638f4b8203a03b381ee0adda4a89171b219b5b969')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
