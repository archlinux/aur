#Maintainer: LevitatingBusinessMan (Rein Fernhout) <me@levitati.ng>

pkgname=zalgo
pkgver=673bd73
arch=("x86_64")
pkgrel=1
pkgdesc="Generate zalgo text"
license=("MIT")
makedepends=("make" "ghc" "git")
url="https://github.com/LevitatingBusinessMan/zalgo"
source=("git+https://github.com/LevitatingBusinessMan/zalgo.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
	cd "${srcdir}/${pkgname}"
    make install PREFIX=$pkgdir/usr/
}
