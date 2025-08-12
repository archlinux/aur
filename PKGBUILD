# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=sony-bravia-cli
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI for controlling Sony Bravia TV's over RS-232"
url="https://github.com/nvllsvm/sony-bravia-cli"
depends=()
makedepends=('cargo')
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nvllsvm/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a46e2cc321a9110be85bf5e068b9e48b1c9b87059d7081a821779a75b24d90e9')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/sony-bravia-cli" "$pkgdir/usr/bin/sony-bravia-cli"
}
