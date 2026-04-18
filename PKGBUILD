pkgname=rudo-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64')
url='https://github.com/skorotkiewicz/rudo'
license=('unknown')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/skorotkiewicz/rudo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8fb44d60524ab3adcd24a9330f7c97e4a35afd315a2fc97cd6128c7c2c836b26')

build() {
    cd "rudo-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "rudo-${pkgver}"
    install -Dm755 target/release/rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
