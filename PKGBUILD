# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=cdimage
pkgname="${_pkgname}-git"
pkgver=r16.4940af6
pkgrel=1
pkgdesc="A tool for burning visible pictures on a compact disc surfase"
arch=("any")
url="https://github.com/arduinocelentano/${_pkgname}"
license=("GPL3")
depends=("qt6-base")
makedepends=("git")
source=("git+${url}.git")
sha512sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    qmake
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm777 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
