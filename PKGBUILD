pkgname=sonic-bridge
pkgver=0.6.0
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol."
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/sonic-bridge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33930268e88a3fa18a4c9b3cecf008c326b525eadb759ffbb724a4382014965c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --bin sonic-bridge
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/sonic-bridge" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
