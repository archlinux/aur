# Maintainer: fa5e4658010be730
pkgname=verify-lib
pkgver=0.0.2
pkgrel=1
pkgdesc="Validates shell library files before sourcing — compiled binary to break the bootstrap problem"
arch=('x86_64')
url="https://gitlab.com/fkzys/verify-lib"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('9abf224ea562e6e0924bb3470459eab65c947b3870342f691a8b421c700bc445')

build() {
    cd "${pkgname}-v${pkgver}"
    make build
}

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
