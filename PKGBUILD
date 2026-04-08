# Maintainer: Gurov <gurov@disroot.org>
pkgname=spout
pkgver=0.1.4
pkgrel=1
pkgdesc="The missing link between your screenshot tool and the internet"
arch=('x86_64')
url="https://github.com/Gur0v/spout"
license=('GPL-3.0-or-later')
depends=()
makedepends=('rust' 'cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gur0v/spout/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4f2073993e984bfe1b35f138201ed1db73a1ee322b827688e405eafb89e41a3')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/spout "$pkgdir/usr/bin/spout"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
