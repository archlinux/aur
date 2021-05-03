# Maintainer: Artem Senichev <artemsen@gmail.com>

_pkgname=xvi
pkgname="${_pkgname}-git"
pkgver=b7f9d8a
pkgrel=1
pkgdesc='Hex editor'
arch=('x86_64')
license=('MIT')
makedepends=('cargo' 'rust' 'git')
url='https://github.com/artemsen/xvi'
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-parse --short HEAD
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m 755 target/release/$_pkgname "${pkgdir}/usr/bin/$_pkgname"
}
