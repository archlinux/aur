# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=sony-bravia-cli
pkgver=0.7.0
pkgrel=1
pkgdesc="CLI for controlling Sony Bravia TV's over RS-232"
url="https://github.com/andrewrabert/sony-bravia-cli"
depends=()
makedepends=('cargo')
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewrabert/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('403978c1cf836a78370c57546f509dcdadbc26abfb422de76f5890e72447122d')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/sony-bravia-cli" "$pkgdir/usr/bin/sony-bravia-cli"
}
