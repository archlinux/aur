#Maintainer: Rein Fernhout (LevitatingBusinessMan) <public@reinfernhout.xyz>

pkgname=alcase
pkgver=r7.298cf11
arch=("x86_64")
pkgrel=1
pkgdesc="Turn text into alternating case"
license=("MIT")
makedepends=("git")
url="https://github.com/LevitatingBusinessMan/alcase"
source=("git+https://github.com/LevitatingBusinessMan/alcase.git")
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
	DESTDIR="$pkgdir" PREFIX="/usr" make install
}
