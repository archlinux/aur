# Maintainer: Filip Priečinský <filippriec@tutanota.com>
pkgname=tansig-lut
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI generation of a Look Up Tables for tansig function with fixed-point arithmetic"
arch=('x86_64')
url="https://gitlab.com/filipriec/tansig-lut"
license=('GPL3')
depends=('cargo')
# source=("https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
source=("https://gitlab.com/filipriec/tansig-lut/-/archive/v$pkgver/tansig-lut-v$pkgver.tar.gz")
sha256sums=('960b96d3cb4fd5db9510ab5f42165a351f3aa3bfe3b2ec907ced10e45a4fa5e7')

build() {
  cd "$pkgname-v$pkgver" #gitlab version format
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver" #gitlab version format
  install -Dm755 "target/release/tansig-lut" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
