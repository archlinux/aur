# Maintainer: fkzys <fkzys at proton dot me>
pkgname=verify-lib
pkgver=0.0.5
pkgrel=1
pkgdesc="Validates shell library files before sourcing — compiled binary to break the bootstrap problem"
arch=('x86_64')
url="https://github.com/fkzys/verify-lib"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b9f4efc7eb62324f96bde572e0578031ececb770b0d2a7fe2dde5e78cd73a618')

build() {
    cd "${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
