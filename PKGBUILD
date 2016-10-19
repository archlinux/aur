# Maintainer: Moritz Persen <moritz.petersen@freenet.de>
pkgname=pot
pkgver=0.2.0
pkgrel=2
pkgdesc="universal tag manager"
arch=('i686' 'x86_64')
url="https://github.com/motersen/pot"
license=('Apache')
makedepends=('make' 'gambit-c' 'musl')
source=("https://github.com/motersen/pot/archive/$pkgver.tar.gz")
sha256sums=('2d3cc09873649323655680193956ae0c608ab30e208642e5d8ab0f8acf264a4c')

build() {
	cd "$pkgname-$pkgver"
	make GSC="gambitc"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
