pkgname=sonic-bridge
pkgver=0.3.2
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol."
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/sonic-bridge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('304a52add75050e7e44aa42338139854aa10a9ed449fe0ef3334f7290d303ae4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --bin sonic-bridge
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/sonic-bridge" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
