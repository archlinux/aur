# Maintainer: matoro <throwaway19587@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=html-xml-utils
pkgver=7.6
pkgrel=1
pkgdesc='A number of simple utilities for manipulating HTML and XML files.'
arch=('i686' 'x86_64')
url='http://www.w3.org/Tools/HTML-XML-utils/'
license=('W3C')
depends=('curl')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('75f810ec1aee60c62b9f25a79f048fc510b63797c271349030deaf8480be2751')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
