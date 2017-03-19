# Maintainer: Moritz Persen <moritz.petersen@freenet.de>
pkgname=pot
pkgver=0.2.2
pkgrel=1
pkgdesc="universal tag manager"
arch=('i686' 'x86_64')
url="https://github.com/motersen/pot"
license=('Apache')
makedepends=('make' 'gambit-c' 'musl')
source=("https://github.com/motersen/pot/archive/$pkgver.tar.gz")
sha512sums=('2b6b47c3c79a29eee602eaba8c4c2f695ce302b0f92caff9eb23f65ed67388f0a7ccc77651550a80ca1192150bbf25bc0d52c525f866f8fc744df02d75fcd8c8')

build() {
	cd "$pkgname-$pkgver"
	make GSC="gambitc"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
