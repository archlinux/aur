# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=sony-bravia-cli
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI for controlling Sony Bravia TV's over RS-232"
url="https://github.com/nvllsvm/sony-bravia-cli"
depends=()
makedepends=('cargo')
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nvllsvm/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f209cf83ab3b18460426312a221c5786ee068e47a79e456a14644291fb1fc32d')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/sony-bravia-cli" "$pkgdir/usr/bin/sony-bravia-cli"
}
