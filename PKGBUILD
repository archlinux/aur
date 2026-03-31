# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=pacmate
pkgver=1.2.0
pkgrel=1
pkgdesc="Interactive terminal UI wrapper for pacman"
arch=('x86_64')
url="https://gitlab.com/nathanchere/pacmate"
license=('Apache-2.0')
depends=('pacman')
makedepends=('go' 'git' 'make')
optdepends=('sudo: default privilege escalation helper')
source=("pacmate::git+https://gitlab.com/nathanchere/pacmate.git#tag=v${pkgver}")
sha256sums=('b1955a56b0966c7820cfb2c0767a215ef2715bb320a1964e9c180a69afa19bfd')

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
