# Maintainer: Filip Priečinský <filippriec@tutanota.com>
pkgname=tansig-lut
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI generation of a Look Up Tables for tansig function with fixed-point arithmetic"
arch=('x86_64')
url="https://gitlab.com/filipriec/tansig-lut"
license=('GPL3')
depends=('cargo')
source=("tansig-lut-$pkgver.tar.gz::https://gitlab.com/filipriec/tansig-lut/-/archive/v1.1.0/tansig-lut-v1.1.0.tar.gz")
sha256sums=('72802b5b9e98e6c47818bb887ebd24b256fcdef1a2082a13fe7b62deb5476b6e')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "target/release/tansig-lut" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
