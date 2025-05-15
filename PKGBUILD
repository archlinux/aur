pkgname=iotop-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight Rust-based terminal I/O monitor (alternative to classic iotop)"
arch=('x86_64')
url="https://github.com/jhenrique04/iotop"
license=('MIT' 'Apache')
depends=()
makedepends=('rust' 'cargo')
provides=('iotop')
conflicts=('iotop')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/iotop-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/iotop-$pkgver"
  install -Dm755 "target/release/iotop" "$pkgdir/usr/bin/iotop"
}

