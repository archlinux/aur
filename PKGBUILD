# Maintainer: fa5e4658010be730
pkgname=verify-lib
pkgver=0.0.3
pkgrel=1
pkgdesc="Validates shell library files before sourcing — compiled binary to break the bootstrap problem"
arch=('x86_64')
url="https://gitlab.com/fkzys/verify-lib"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('fb2c2b6d954e670d993eb09c2be7b2f89f537cc723ba014a3a2f429e7e4c677c')

build() {
    cd "${pkgname}-v${pkgver}"
    make build
}

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
