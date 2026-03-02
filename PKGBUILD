pkgname=dpibreak
pkgver=0.5.0
pkgrel=1
pkgdesc="fast and easy-to-use DPI circumvention tool in Rust."
arch=('x86_64')
url="https://github.com/Dilluti0n/DPIBreak"
license=('GPL-3.0-or-later')
depends=('nftables')
makedepends=('rust' 'cargo')
source=("https://github.com/Dilluti0n/DPIBreak/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('59d94cc86f9003f076d321c59f2df182154a88d09a65acace123e102c37b5019')

build() {
    cd "dpibreak-${pkgver}"
    cargo build --release
}

package() {
    cd "dpibreak-${pkgver}"
    install -Dm755 target/release/dpibreak "$pkgdir/usr/bin/dpibreak"
    install -Dm644 dpibreak.1 "$pkgdir/usr/share/man/man1/dpibreak.1"
}
