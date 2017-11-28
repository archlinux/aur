# Maintainer: matoro <throwaway19587@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=html-xml-utils
pkgver=7.4
pkgrel=1
pkgdesc='A number of simple utilities for manipulating HTML and XML files.'
arch=('i686' 'x86_64')
url='http://www.w3.org/Tools/HTML-XML-utils/'
license=('W3C')
depends=('curl')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('2541c3e1f22f0bb2e66e846f8e4fd3afb95b80ce71d37853fb962ba7a1caef12')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
