# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.5.0
pkgrel=1
pkgdesc="A simple password manager for geeks"
url="https://github.com/conradkleinespel/rooster"
makedepends=('cargo' 'pkg-config' 'libx11' 'libxmu')
arch=('i686' 'x86_64')
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('f0814d09ab995f2c2dc556784310cd268cb4722ad18f9c201a50c9e795b4963d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
  cargo build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
  install -Dm755 target/debug/rooster-clipboard "$pkgdir/usr/bin/rooster-clipboard"
}
