pkgname=diskard
pkgver=0.1.1
pkgrel=1
pkgdesc="A fast TUI disk usage analyzer with trash/delete functionality"
arch=('x86_64')
url="https://github.com/shoenot/diskard"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shoenot/diskard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c5c5df3c78cf5128ac52b0540d9c389950c976a50b7e35d6ad60812b898158dc')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/diskard "$pkgdir/usr/bin/diskard"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
