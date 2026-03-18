# Maintainer: fa5e4658010be730
pkgname=verify-lib
pkgver=0.0.4
pkgrel=1
pkgdesc="Validates shell library files before sourcing — compiled binary to break the bootstrap problem"
arch=('x86_64')
url="https://gitlab.com/fkzys/verify-lib"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('a95e04674ddd2d5d88b700d8e6af4dd62a53140d02131b8ddf69903d04e0e94d')

build() {
    cd "${pkgname}-v${pkgver}"
    make build
}

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
