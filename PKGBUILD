# Maintainer: matoro <throwaway19587@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=html-xml-utils
pkgver=8.0
pkgrel=1
pkgdesc='A number of simple utilities for manipulating HTML and XML files.'
arch=('i686' 'x86_64')
url='http://www.w3.org/Tools/HTML-XML-utils/'
license=('W3C')
depends=('curl' 'libidn2' )
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('749059906c331c2c7fbaceee02466245a237b91bd408dff8f396d0734a060ae2')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
