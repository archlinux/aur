# Maintainer: Gurov <gurov@disroot.org>
pkgname=spout
pkgver=0.1.6
pkgrel=1
pkgdesc="The missing link between your screenshot tool and the internet"
arch=('x86_64')
url="https://github.com/Gur0v/spout"
license=('GPL-3.0-or-later')
depends=()
makedepends=('rust' 'cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gur0v/spout/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fef30897c49ccbd0ce0e37b87f0ebb7f87af7c6e7f9b5522fd2940c596105255')

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
