pkgname=dpibreak
pkgver=0.6.0
pkgrel=1
pkgdesc="fast and easy-to-use DPI circumvention tool in Rust."
arch=('x86_64')
url="https://github.com/dilluti0n/dpibreak"
license=('GPL-3.0-or-later')
depends=('nftables')
makedepends=('rust' 'cargo')
source=("https://github.com/dilluti0n/dpibreak/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1ac5ee853c1de5c5a318a8d664441e7608a4965867f3c2d6f4d3f2fcc53cc0f3')

build() {
    cd "dpibreak-${pkgver}"
    cargo build --release
}

package() {
    cd "dpibreak-${pkgver}"
    install -Dm755 target/release/dpibreak "$pkgdir/usr/bin/dpibreak"
    install -Dm644 dpibreak.1 "$pkgdir/usr/share/man/man1/dpibreak.1"
}
