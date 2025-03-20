# Maintainer: Filip Priečinský <filippriec@tutanota.com>
pkgname=tansig-lut
pkgver=1.2.1
pkgrel=1
pkgdesc="CLI generation of a Look Up Tables for tansig function with fixed-point arithmetic"
arch=('x86_64')
url="https://gitlab.com/filipriec/tansig-lut"
license=('GPL3')
depends=('cargo')
# source=("https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
source=("https://gitlab.com/filipriec/tansig-lut/-/archive/v$pkgver/tansig-lut-v$pkgver.tar.gz")
sha256sums=('7ac2b9d56a090b345c88db8b0bd07406bc194d814c688e62395c1d8ebc8a811f')

build() {
  cd "$pkgname-v$pkgver" #gitlab version format
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver" #gitlab version format
  install -Dm755 "target/release/tansig-lut" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
