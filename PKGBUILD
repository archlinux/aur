pkgname=refresh
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight command-line project manager"
arch=('x86_64')
url="https://github.com/Ametrine-cc/Refresh"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ametrine-cc/Refresh/archive/v$pkgver.tar.gz")
sha256sums=('2caf24137c92c44fde50765ebfb3e9ab8c12d5d9af1f8a263e97082e3cfacac9')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
