#Maintainer: Pierre Chevalier <pierrechevalier83@gmail.com>

pkgname=palette-rs
_pkgname=palette-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A cli ansi color palette written in rust"
url="https://github.com/pierrechevalier83/palette"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('bb4fd341fb8d72eadab28d30272b85ce06e66fbeda497e4435f5a3bafbc790b1')
build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/palette-rs "$pkgdir/usr/bin/palette-rs"
}
