# Maintainer: Filip Priečinský <filippriec@tutanota.com>
pkgname=tansig-lut
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI generation of a Look Up Tables for tansig function with fixed-point arithmetic"
arch=('x86_64')
url="https://gitlab.com/filipriec/tansig-lut"
license=('GPL3')
depends=('cargo')
source=("https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('267b5fb89b52a1597bd0f24c2f38c80046213d2a9eeee21da2b8fab51cafbf07')

build() {
#  cd "$pkgname-v$pkgver" #gitlab format
  cd "$pkgname-$pkgver" #crates.io format
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "target/release/tansig-lut" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
