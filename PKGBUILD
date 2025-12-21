pkgname=mfetch
pkgver=0.0.3
pkgrel=1
pkgdesc="📦 memory-focused system info tool written in Rust."
arch=('x86_64')
url="https://github.com/xdearboy/mfetch"
license=('MIT')
depends=('i2c-tools')
makedepends=('rust' 'cargo')
source=("https://github.com/xdearboy/mfetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74d4c71b88ce4b2ab99d8cd88f43b9948642370b4da329ab95eda23442e953fe')

build() {
  cd "$srcdir/mfetch-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/mfetch-$pkgver"
  install -Dm755 "target/release/mfetch" "$pkgdir/usr/bin/mfetch"
}
