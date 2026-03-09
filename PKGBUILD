pkgname=dpibreak
pkgver=0.5.1
pkgrel=1
pkgdesc="fast and easy-to-use DPI circumvention tool in Rust."
arch=('x86_64')
url="https://github.com/dilluti0n/dpibreak"
license=('GPL-3.0-or-later')
depends=('nftables')
makedepends=('rust' 'cargo')
source=("https://github.com/dilluti0n/dpibreak/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac9e18b23fc9502576b34ded9f0347aab53499fca6fab1acc20500ed1ec45014')

build() {
    cd "dpibreak-${pkgver}"
    cargo build --release
}

package() {
    cd "dpibreak-${pkgver}"
    install -Dm755 target/release/dpibreak "$pkgdir/usr/bin/dpibreak"
    install -Dm644 dpibreak.1 "$pkgdir/usr/share/man/man1/dpibreak.1"
}
