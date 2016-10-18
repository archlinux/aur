# Maintainer: Moritz Persen <moritz.petersen@freenet.de>
pkgname=pot
pkgver=0.2.0
pkgrel=1
pkgdesc="universal tag manager"
arch=('i686' 'x86_64')
url="https://github.com/motersen/pot"
license=('Apache')
makedepends=('make' 'gambit-c' 'musl')
source=("https://github.com/motersen/pot/archive/$pkgver.tar.gz")
md5sums=('ed98b4ecd32214773f3d69b845144449')

build() {
	cd "$pkgname-$pkgver"
	make GSC="gambitc"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
