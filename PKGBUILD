# Maintainer: Michal Siedlaczek <siedlaczek at pm dot me>
pkgname=ciff-pisa
pkgver=0.1.1
pkgrel=1
pkgdesc="Conversion tool from PISA binary collection to CIFF and back"
arch=('any')
url="https://github.com/pisa-engine/ciff/"
license=('Apache License 2.0')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('0f73dcd5accec881b52b414cf3ac36c8')

build() {
    cd "ciff-${pkgver}"
    cargo build --release --locked
}

package() {
    install -Dm755 "ciff-${pkgver}/target/release/ciff2pisa" "${pkgdir}/usr/bin/ciff2pisa"
    install -Dm755 "ciff-${pkgver}/target/release/pisa2ciff" "${pkgdir}/usr/bin/pisa2ciff"
}
