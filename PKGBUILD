# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=sony-bravia-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI for controlling Sony Bravia TV's over RS-232"
url="https://github.com/nvllsvm/sony-bravia-cli"
depends=()
makedepends=('cargo')
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nvllsvm/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('1c06270fdc4fc2273089d4c1a1ac9df8b5ac1bdd417a6ae332024e734fda9823')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/sony-bravia-cli" "$pkgdir/usr/bin/sony-bravia-cli"
}
