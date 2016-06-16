# Maintainer: N30N <archlinux@alunamation.com>

pkgname="ttysys"
pkgver=0.8.r0.g61c183d
pkgrel=1
pkgdesc="A live ncurses cpu and memory usage graph"
url="https://github.com/rigel314/ttysys"
license=("GPL3")
arch=("i686" "x86_64")
depends=("ncurses")
makedepends=("git")
# source=("git+https://github.com/rigel314/ttysys.git#tag=v${pkgver}")
source=("git+https://github.com/rigel314/ttysys.git")
md5sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	git describe --long | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	install -Dm755 build/target/ttysys "${pkgdir}/usr/bin/ttysys"
}

# vim: set noet ff=unix:
