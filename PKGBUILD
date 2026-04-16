pkgname=dpibreak
pkgver=0.6.1
pkgrel=1
pkgdesc="fast and easy-to-use DPI circumvention tool in Rust."
arch=('x86_64')
url="https://github.com/dilluti0n/dpibreak"
license=('GPL-3.0-or-later')
depends=('nftables')
makedepends=('rust' 'cargo')
source=("https://github.com/dilluti0n/dpibreak/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('274febb7c35293ad4c92a4df0a1c2cc37316919eab8f11429fc5b7dfbf07ac07')

build() {
    cd "dpibreak-${pkgver}"
    cargo build --release
}

package() {
    cd "dpibreak-${pkgver}"
    install -Dm755 target/release/dpibreak "$pkgdir/usr/bin/dpibreak"
    install -Dm644 dpibreak.1 "$pkgdir/usr/share/man/man1/dpibreak.1"
}
