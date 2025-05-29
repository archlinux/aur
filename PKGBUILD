pkgname=soon
pkgver=0.1.6
pkgrel=1
pkgdesc="🤖 Predict your next shell command based on history — like shell autocomplete, but MORE stupid"
arch=('x86_64')
url="https://github.com/HsiangNianian/soon"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HsiangNianian/soon/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/soon" "$pkgdir/usr/bin/soon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
