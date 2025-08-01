# Maintainer: RoboSync Team <robosync@example.com>
pkgname=robosync
pkgver=1.0.2
pkgrel=1
pkgdesc="High-performance file synchronization with intelligent concurrent processing"
arch=('x86_64' 'aarch64')
url="https://github.com/roethlar/robosync"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('b8701be190073e481f67b8e6e0fb4baf63a5df9b735f1ee76b66fda7ab95dc78')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}