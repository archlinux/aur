pkgname=mfetch
pkgver=0.2.0
pkgrel=1
pkgdesc="📦 memory-focused system info tool written in Rust."
arch=('x86_64')
url="https://github.com/xdearboy/mfetch"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("https://github.com/xdearboy/mfetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8fe43b2e5ac6aca6aa2ae70363526e2ff00c64d5e3d808eafca4e07278c1d822')

build() {
  cd "$srcdir/mfetch-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/mfetch-$pkgver"
  install -Dm755 "target/release/mfetch" "$pkgdir/usr/bin/mfetch"
}
