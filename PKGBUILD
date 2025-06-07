# Maintainer: Gabriel Bjørnager Jensen <gabriel@achernar.io>

pkgname=agbsum-git
pkgver=1.0
pkgrel=1
pkgdesc="AGB image header checksum patcher."
arch=("any")
url="https://mandelbrot.dk/bjoernager/agbsum/"
license=("GPL-3.0-only")
makedepends=("git")
provides=("agbsum")
conflicts=("agbsum")
source=("git+https://gitlab.com/bjoernager/agbsum.git")
sha512sums=("SKIP")

pkgver() {
	cd "${srcdir}/agbsum"

	echo -n "$(git describe --abbrev=0)"
}

build() {
	cd "${srcdir}/agbsum"

	make -j$(($(nproc) + 1))
}

package() {
	cd "${srcdir}/agbsum"

	make install BINDIR="${pkgdir}/usr/bin"
}

