# Maintainer: BlindingDark <blindingdark@outlook.com>

pkgname=wordninja-rs
_pkgname=wordninja
pkgver=0.1.0
pkgrel=1
pkgdesc="Split English sentence without spaces into words."
url="https://github.com/chengyuhui/wordninja-rs"
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
provides=(wordninja)
conflicts=(wordninja)
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('62f71d7204da91574de8ea56646b8b525ff179b477ca4782fabe1b27a097dc0c')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
