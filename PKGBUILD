# Maintainer: Jeremy Baxter <jtbx@disroot.org>

_pkgname=ninvaders
pkgname="${_pkgname}"-git
pkgver=r2.98cab46
pkgrel=1
pkgdesc="Ncurses based space invaders clone"
arch=("i686" "x86_64")
url="http://ninvaders.sourceforge.net"
license=("GPL")
source=("${_pkgname}::git+https://git.code.sf.net/p/ninvaders0/code")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${_pkgname}"
	make CFLAGS="${CFLAGS}"
}

package() {
	cd "${_pkgname}"
	install -m755 -D nInvaders "${pkgdir}"/usr/bin/"${_pkgname}"
}
