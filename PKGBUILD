# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=sony-bravia-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for controlling Sony Bravia TV's over RS-232"
url="https://github.com/nvllsvm/sony-bravia-cli"
depends=()
makedepends=('cargo')
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nvllsvm/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('47bc338e21ff98993ff44f2c3ffd2f9884aadb8306fe3882c8a9d50c08c61b70')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/sony-bravia-cli" "$pkgdir/usr/bin/sony-bravia-cli"
}
