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
sha256sums=('b6d82d925126f7a5b6a775f9edc0c3dfcbe45757dc9abd1b8c274b8da4538062')

build() {
  cd "$srcdir/mfetch-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/mfetch-$pkgver"
  install -Dm755 "target/release/mfetch" "$pkgdir/usr/bin/mfetch"
}
