# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=sldr
pkgver=0.6.0
pkgrel=1
pkgdesc="Modular markdown presentations powered by slidev"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/sldr"
license=('MIT')
provides=('sldr')
conflicts=('sldr-bin')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/byteowlz/sldr/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/sldr "${pkgdir}/usr/bin/sldr"
    install -Dm755 target/release/sldr-server "${pkgdir}/usr/bin/sldr-server"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
