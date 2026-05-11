# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=kwinctrl
pkgver=0.1.0
pkgrel=1
pkgdesc="KWin CLI Control"
url="https://github.com/andrewrabert/kwinctrl"
depends=()
makedepends=('cargo')
options=(!lto)
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewrabert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2ae92f981887b5d017d7a5f650b70f7bb3e25a6f2b71335a96290f941d2a0b39')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/kwinctrl" "$pkgdir/usr/bin/kwinctrl"
}
