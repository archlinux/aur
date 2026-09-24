pkgname=diskard
pkgver=0.1.2
pkgrel=1
pkgdesc="A fast TUI disk usage analyzer with trash/delete functionality and breakdowns by file extension"
arch=('x86_64')
url="https://github.com/shoenot/diskard"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shoenot/diskard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04c10ed748f1ebb9db02e6140b1737d1a0df2ffe371e4b8e5c9857226d8091c1')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/diskard "$pkgdir/usr/bin/diskard"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
