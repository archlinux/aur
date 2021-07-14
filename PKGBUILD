# Maintainer: Daniel Massey <masseyd1396@gmail.com>

pkgname="ghostgame"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="A simple RNG-based game, originally written in Python, re-written in Go."
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
url="https://github.com/TheSonicMaster/ghostgame"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheSonicMaster/$pkgname/archive/refs/tags/$pkgver.tar.gz")
md5sums=("0182eb72d405245ff10ffa9461f79e85")
sha1sums=("26fe75fa04883152b8f11c746d0a91a5a44a9c24")
sha256sums=("df6a31a4c27a5dd8c5e04ad8411c42b6c554912e469b5b458e65091dd5fa25ad")
sha512sums=("a651966618b50b5958b4095972a00830692e68ff99444a982a9cfec142e2ae31fb3ab95a8e27ebd313e07f0d1d7f77089dae6a022cfbeaf03137038e6987d1a3")

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir PREFIX=/usr install
}
