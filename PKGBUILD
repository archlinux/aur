# Maintainer: fkzys <fkzys at proton dot me>
pkgname=verify-lib
pkgver=0.0.4
pkgrel=1
pkgdesc="Validates shell library files before sourcing — compiled binary to break the bootstrap problem"
arch=('x86_64')
url="https://github.com/fkzys/verify-lib"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0eb765596e4192cb1195e7db4eacef2fe3437bd118e5747351b7954579a8e71e')

build() {
    cd "${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
