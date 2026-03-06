pkgname=diskard
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast TUI disk usage analyzer with trash/delete functionality"
arch=('x86_64')
url="https://github.com/shoenot/diskard"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shoenot/diskard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5e6c6e1de120632885e53b99fe5da078636cca74390fe711189812e08528f62')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/diskard "$pkgdir/usr/bin/diskard"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
