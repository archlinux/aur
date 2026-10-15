# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=cloneholio
pkgver=0.17.0
pkgrel=1
pkgdesc="CLI for the AWeber API"
url="https://github.com/andrewrabert/cloneholio"
depends=()
makedepends=('cargo')
options=(!lto)
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewrabert/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a94c3c18ab7b151108c4af3d4ccbf3e2bf92b909b382f2c3dfb1721d8d9e7d43')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/aweber" "$pkgdir/usr/bin/aweber"
}
