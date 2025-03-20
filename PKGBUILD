# Maintainer: Filip Priečinský <filippriec@tutanota.com>
pkgname=tansig-lut
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI generation of a Look Up Tables for tansig function with fixed-point arithmetic"
arch=('x86_64')
url="https://gitlab.com/filipriec/tansig-lut"
license=('GPL3')
depends=('cargo')
source=("https://gitlab.com/filipriec/tansig-lut/-/archive/v$pkgver/tansig-lut-v$pkgver.tar.gz")
sha256sums=('b9b3a77fa182897e40dd4a8997466438eed69870117f656b07136675bf292f93')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "target/release/tansig-lut" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
