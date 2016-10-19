# Maintainer: Moritz Persen <moritz.petersen@freenet.de>
pkgname=pot
pkgver=0.2.1
pkgrel=1
pkgdesc="universal tag manager"
arch=('i686' 'x86_64')
url="https://github.com/motersen/pot"
license=('Apache')
makedepends=('make' 'gambit-c' 'musl')
source=("https://github.com/motersen/pot/archive/$pkgver.tar.gz")
sha512sums=('2bb4946534dcaecb1b87c4eda763f92746cc1905c6e9af9d26ff779af467e4c5fe62182cf9007845db29e11c6fc6f4cd19e559ba4d9d552735ac515a9754a86c')

build() {
	cd "$pkgname-$pkgver"
	make GSC="gambitc"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
