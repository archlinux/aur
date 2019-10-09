# Maintainer: matoro <throwaway19587@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=html-xml-utils
pkgver=7.8
pkgrel=1
pkgdesc='A number of simple utilities for manipulating HTML and XML files.'
arch=('i686' 'x86_64')
url='http://www.w3.org/Tools/HTML-XML-utils/'
license=('W3C')
depends=('curl' 'libidn2' )
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('9ab41c9277efc699603d062c10740c6e528fdb9ac35014db4e07f16ad8700d5d')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
