pkgname=rudo-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64')
url='https://github.com/skorotkiewicz/rudo'
license=('unknown')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/skorotkiewicz/rudo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('025a3e472626652646e43a922d2a79439586c60824d6b779c81cc7f1cced839c')

build() {
    cd "rudo-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "rudo-${pkgver}"
    install -Dm755 target/release/rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
