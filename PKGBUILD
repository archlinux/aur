pkgname=helix-vcs
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern version control system written in Rust"
arch=('x86_64')
url="https://github.com/amirhosseinghanipour/helix"
license=('MIT')
depends=('gcc' 'openssl' 'curl')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/helix-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/helix-$pkgver"
  install -Dm755 "target/release/hx" "$pkgdir/usr/bin/hx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
} 