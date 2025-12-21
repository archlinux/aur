pkgname=mfetch
pkgver=0.3.0
pkgrel=1
pkgdesc="📦 memory-focused system info tool written in Rust."
arch=('x86_64')
url="https://github.com/xdearboy/mfetch"
license=('MIT')
depends=('i2c-tools')
makedepends=('rust' 'cargo')
source=("https://github.com/xdearboy/mfetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c198525d3e503cf3b982800d4484154f4070e2b81549024fb21ecc396bcb0cb')

build() {
  cd "$srcdir/mfetch-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/mfetch-$pkgver"
  install -Dm755 "target/release/mfetch" "$pkgdir/usr/bin/mfetch"
}
