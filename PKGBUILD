#Maintainer: Pierre Chevalier <pierrechevalier83@gmail.com>

pkgname=2048-rs
_pkgname=game-2048
pkgver=0.4.0
pkgrel=1
pkgdesc="A cli implementation of the popular 2048 game written in rust"
url="https://github.com/pierrechevalier83/2048"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('73ab1f3ffa49e5149774358ffd9f0ad0bec0e6f18644f72436650dc53226e0f7')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/game-2048 "$pkgdir/usr/bin/2048-rs"
}
