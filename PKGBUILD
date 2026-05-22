pkgname=rustxo
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast-paced Tic Tac Toe game written in Rust"
arch=('x86_64')
url="https://github.com/Real-Yash/rustxo"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/rustxo \
        "$pkgdir/usr/bin/rustxo"

    install -Dm644 tic-tac-toe-reactor.desktop \
        "$pkgdir/usr/share/applications/rustxo.desktop"
}
