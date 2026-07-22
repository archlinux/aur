# Maintainer: hongnoul <namyang@mit.edu>
pkgname=hwatu
pkgver=0.6.0
pkgrel=1
pkgdesc="Visual verification browser for AI coding agents: daemon-based WebKitGTK, real rendering, ~13ms window spawn"
arch=('x86_64')
url="https://github.com/hongnoul/hwatu"
license=('MIT')
depends=('webkitgtk-6.0' 'gtk4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hongnoul/hwatu/archive/v$pkgver.tar.gz")
sha256sums=('1397ab5e9969a6c7d865bc343ba90fd10f629b3633e037b980e16cafa97ae78a')

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
