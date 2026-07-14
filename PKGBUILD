pkgname=dpibreak
pkgver=0.6.1
pkgrel=1
pkgdesc="System-wide DPI circumvention with minimal configuration"
arch=('x86_64')
url="https://github.com/dilluti0n/dpibreak"
license=('GPL-3.0-or-later')
depends=('nftables')
makedepends=('rust' 'cargo')
source=("https://github.com/dilluti0n/dpibreak/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a61d445b6f25f895cb9d5c976079e0dc7fb8d9fac592e497f9fc703df82c905')

build() {
    cd "dpibreak-${pkgver}"
    cargo build --release
}

package() {
    cd "dpibreak-${pkgver}"
    install -Dm755 target/release/dpibreak "$pkgdir/usr/bin/dpibreak"
    install -Dm644 dpibreak.1 "$pkgdir/usr/share/man/man1/dpibreak.1"
}
