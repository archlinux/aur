pkgname=sonic-bridge
pkgver=0.4.2
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol."
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/sonic-bridge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80408ddcba9932fa4762d1af411b125b715b5e2ec267faacaa4b8a164eb0462b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --bin sonic-bridge
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/sonic-bridge" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
