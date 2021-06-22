# Maintainer: Daniel Massey <masseyd1396@gmail.com>

pkgname="ghostgame"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="A simple RNG-based game, originally written in Python, re-written in Go."
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
url="https://github.com/TheSonicMaster/ghostgame"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheSonicMaster/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("9fca9690801be4e611e519b2480801cfc2d2d57b7285de7701db4761e4048fb385d5956ead6d95cdeadd71b2a2b24ffa32fa277791a98dafe6dcb4f10399456d")

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir PREFIX=/usr install
}
