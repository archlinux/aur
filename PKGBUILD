# Maintainer: hongnoul <namyang@mit.edu>
pkgname=hwatu
pkgver=0.4.0
pkgrel=1
pkgdesc="Daemon-based WebKitGTK browser for tiling WMs: real rendering, ~13ms window spawn"
arch=('x86_64')
url="https://github.com/hongnoul/hwatu"
license=('MIT')
depends=('webkitgtk-6.0' 'gtk4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hongnoul/hwatu/archive/v$pkgver.tar.gz")
sha256sums=('4d5e290577e4b7d3e389e7ce76f8f20bbfbc0556e3e6262bb9631d6625a4220a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/hwatu "$pkgdir/usr/bin/hwatu"
  install -Dm755 target/release/hwatud "$pkgdir/usr/bin/hwatud"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
