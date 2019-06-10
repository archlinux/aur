# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=eta
pkgname=${_pkgname}-git
pkgver=r14.d91d294
pkgrel=2
pkgdesc="Tool for monitoring ETA and progress of an arbitrary process"
arch=("any")
url="https://github.com/aioobe/eta"
license=("GPL3")

depends=()
makedepends=("git" "gcc")

source=("${_pkgname}::git+https://github.com/aioobe/eta.git")
sha512sums=('SKIP')


pkgver() {
    cd "${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"

    make
}

package() {
    cd "${_pkgname}"

    install -Dm 755 "eta" "${pkgdir}/usr/bin/eta"
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
    install -Dm 644 "docs/eta.1" "${pkgdir}/usr/share/man/man1/eta.1"
}
