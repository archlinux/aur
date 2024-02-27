# shellcheck shell=bash
# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>
pkgname=riverguile-git
pkgver=r21.a5b129d
pkgrel=1
pkgdesc="Scripting layer for the river Wayland server using Guile Scheme."
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/${pkgname%-git}"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+https://git.sr.ht/~leon_plickat/${pkgname%-git}")
sha256sums=('SKIP')
license=('GPL3')

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
    make install PREFIX="${pkgdir}/usr"
}
