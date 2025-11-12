# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=pacmate
pkgver=1.0.3
pkgrel=2
pkgdesc="Interactive terminal UI wrapper for pacman"
arch=('x86_64')
url="https://gitlab.com/nathanchere/pacmate"
license=('Apache-2.0')
depends=('pacman')
makedepends=('go' 'git' 'make')
optdepends=('sudo: default privilege escalation helper')
source=("pacmate::git+https://gitlab.com/nathanchere/pacmate.git#tag=v${pkgver}")
sha256sums=('d7f6d5ca5a38c1c5310576e8a813d3a0d1c57c3362661e154fd682bd495b4b82')

build() {
    cd "${srcdir}/pacmate"
    make build
}

check() {
    cd "${srcdir}/pacmate"
    make test
}

package() {
    cd "${srcdir}/pacmate"
    make DESTDIR="${pkgdir}" install
}
