# Maintainer: Giacomo Comitti <dev@gcomit.com>
pkgname=blkmenu
pkgver=0.3.1
_pkgname="_${pkgname}"
pkgrel=1
pkgdesc="Tiny curses wrapper around lsblk and udisksctl"
arch=("i686" "x86_64")
url="https://github.com/gcmt/blkmenu"
license=("MIT")
provides=("blkmenu")
conflicts=("blkmenu")
depends=("python" "udisks2" "util-linux")
makedepends=("git" "asciidoc")
source=("${_pkgname}::git+https://github.com/gcmt/blkmenu")
sha1sums=("SKIP")

pkgver() {
	git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

package() {
	install -Dm755 "${_pkgname}/blkmenu" "${pkgdir}/usr/bin/blkmenu"
	install -Dm644 "${_pkgname}/blkmenu.1" "${pkgdir}/usr/share/man/man1/blkmenu.1"
	install -Dm644 "${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
