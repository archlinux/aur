# Maintainer: Moritz Persen <moritz.petersen@freenet.de>
pkgname=pot
pkgver=0.2.0
pkgrel=3
pkgdesc="universal tag manager"
arch=('i686' 'x86_64')
url="https://github.com/motersen/pot"
license=('Apache')
makedepends=('make' 'gambit-c' 'musl')
source=("https://github.com/motersen/pot/archive/$pkgver.tar.gz")
sha512sums=('8ea18529b058808323dae282591535fbb3e47ec85e51752a9649c5e9f5d1ec53b25b626aeafb059fcb339187f82cea04b88692231711f610e4bced8d144e7966')

build() {
	cd "$pkgname-$pkgver"
	make GSC="gambitc"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
