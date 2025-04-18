# Maintainer: Elia Nitsche <nitscheelia at gmail.com>
pkgname="v-editor-git"
_pkgname=${pkgname%-git}
pkgver=v1.0.r0.gcdd1997
pkgrel=1
pkgdesc="simple wrapper for your editor"
arch=("x86_64")
url="https://github.com/egnrse/v-editor"
license=("GPL3")
makedepends=("git")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
    cd "${pkgname}"
	install -Dm755 "./v-editor" "${pkgdir}/usr/bin/v"
	install -Dm644 "./v.1" "${pkgdir}/usr/share/man/man1/v.1"
}
