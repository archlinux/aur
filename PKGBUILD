# Maintainer: Filip Priečinský <filippriec@tutanota.com>
pkgname=tansig-lut
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI generation of a Look Up Tables for tansig function with fixed-point arithmetic"
arch=('x86_64')
url="https://gitlab.com/filipriec/tansig-lut"
license=('GPL3')
depends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/filipriec/tansig-lut/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('64395bdc650a033335c6a2711a14dce7f12a47a4d62e4fc6264088cb0f810ffa')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "target/release/tansig-lut" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
