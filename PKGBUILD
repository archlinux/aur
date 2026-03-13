# Maintainer: fa5e4658010be730
pkgname=verify-lib
pkgver=0.0.1
pkgrel=1
pkgdesc="Validates shell library files before sourcing — compiled binary to break the bootstrap problem"
arch=('x86_64')
url="https://gitlab.com/fkzys/verify-lib"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('41621471fa15ee586b210da817f7234f886673e81b9875aafff9e00350f181b7')

build() {
    cd "${pkgname}-v${pkgver}"
    make build
}

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
