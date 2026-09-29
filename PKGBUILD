pkgname=diskard
pkgver=0.1.3
pkgrel=1
pkgdesc="A fast TUI disk usage analyzer with trash/delete functionality and breakdowns by file extension"
arch=('x86_64')
url="https://github.com/shoenot/diskard"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shoenot/diskard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('846b5512ade83d055ecff7326c1f81f07a4a6ff5977720571ef926593dc173ee')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/diskard "$pkgdir/usr/bin/diskard"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
