# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=pacmate
pkgver=1.2.1
pkgrel=1
pkgdesc="Interactive terminal UI wrapper for pacman"
arch=('x86_64')
url="https://gitlab.com/nathanchere/pacmate"
license=('Apache-2.0')
depends=('pacman')
makedepends=('go' 'git' 'make')
optdepends=('sudo: default privilege escalation helper')
source=("pacmate::git+https://gitlab.com/nathanchere/pacmate.git#tag=v${pkgver}")
sha256sums=('SKIP')

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
