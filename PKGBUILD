# Maintainer: Jan Felix Langenbach <o.hase3 at gmail dot com>
pkgname=makepp
pkgver=2.0.99.2
pkgrel=1
pkgdesc="Compatible but reliable and improved replacement for make"
arch=('any')
url="http://makepp.sourceforge.net/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.8')
source=("$pkgname-$pkgver.txz::https://sourceforge.net/projects/$pkgname/files/2.1/$pkgname-$pkgver.txz/download")
sha1sums=('c7696cd00a28114c8c667ef5f735e010a00023ad')
md5sums=('62aa55f8a20a4256f7413746724be58a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
