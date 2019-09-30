# Maintainer: Giacomo Comitti <dev@gcomit.com>
pkgname=mktree
pkgver=0.3.2
_pkgname="_${pkgname}"
pkgrel=1
pkgdesc="Simple tool for creating directory trees in one shot"
arch=("i686" "x86_64")
url="https://github.com/gcmt/mktree"
license=("MIT")
provides=("mktree")
conflicts=("mktree")
depends=("python")
makedepends=("git" "asciidoc")
source=("${_pkgname}::git+https://github.com/gcmt/mktree")
sha1sums=("SKIP")

pkgver() {
	git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

package() {
	install -Dm755 "${_pkgname}/mktree" "${pkgdir}/usr/bin/mktree"
	install -Dm644 "${_pkgname}/mktree.1" "${pkgdir}/usr/share/man/man1/mktree.1"
	install -Dm644 "${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
