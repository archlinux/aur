# Maintainer: Filip Priečinský <filippriec@tutanota.com>
pkgname=tansig-lut
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI generation of a Look Up Tables for tansig function with fixed-point arithmetic"
arch=('x86_64')
url="https://gitlab.com/filipriec/tansig-lut"
license=('GPL3')
depends=('cargo')
source=("tansig-lut-v$pkgver.tar.gz::https://gitlab.com/filipriec/tansig-lut/-/archive/v$pkgver/tansig-lut-v$pkgver.tar.gz")
sha256sums=('c6daf6fe3590f26cf06d48ee72f7e464beb7718a1462a1f24957ce2c2a207890')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "target/release/tansig-lut" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
