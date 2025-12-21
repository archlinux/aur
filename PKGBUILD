pkgname=mfetch
pkgver=0.3.2
pkgrel=1
pkgdesc="📦 memory-focused system info tool written in Rust."
arch=('x86_64')
url="https://github.com/xdearboy/mfetch"
license=('MIT')
depends=('i2c-tools')
makedepends=('rust' 'cargo')
source=("https://github.com/xdearboy/mfetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b320395f96bac8c901b07bb301ef4c4d4b367c73f4d3d1f5f865192b0e21735f')

build() {
  cd "$srcdir/mfetch-$pkgver"
  cargo build --release 
}

package() {
  cd "$srcdir/mfetch-$pkgver"
  install -Dm755 "target/release/mfetch" "$pkgdir/usr/bin/mfetch"
}
