#Maintainer: Pierre Chevalier <pierrechevalier83@gmail.com>

pkgname=2048-rs
_pkgname=game-2048
pkgver=0.5.0
pkgrel=1
pkgdesc="A very pretty cli implementation of the popular 2048 game written in rust"
url="https://github.com/pierrechevalier83/2048-rs"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('7b4c6bb8bc283427b2faac0817c0d14dcf97a04c07436f76076b941be7ddb07d')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/game-2048 "$pkgdir/usr/bin/2048"
}
