# Maintainer: Gabriel Jensen <gabrielbjensen@icloud.com>
pkgname=agbsum-git
pkgver=11
pkgrel=1
pkgdesc="GBA ROM header checksum patcher."
arch=("any")
url="https://mandelbrot.dk/agbsum"
makedepends=("git")
provides=("agbsum")
conflicts=("agbsum")
source=("git+https://mandelbrot.dk/agbsum")
license=("AGPL3")
sha512sums=("SKIP")
pkgver() {
	cd "${srcdir}/agbsum"
	printf "%s" "$(git describe --abbrev=0)"
}
build() {
	cd "${srcdir}/agbsum"
	make -j$(($(nproc)+0x1))
}
package() {
	cd "${srcdir}/agbsum"
	make install BINDIR="${pkgdir}/usr/bin"
}

