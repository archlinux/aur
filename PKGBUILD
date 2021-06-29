# Maintainer: Daniel Massey <masseyd1396@gmail.com>

pkgname="ghostgame"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="A simple RNG-based game, originally written in Python, re-written in Go."
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
url="https://github.com/TheSonicMaster/ghostgame"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheSonicMaster/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("85401c93477612240ec4c0e35ef294f4e82a1365217ae0d60394d1a7efb80016d5238a771e88ec69a94632b571d43ff1a1b08c30db83f8a2745c16955bc76aec")

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir PREFIX=/usr install
}
