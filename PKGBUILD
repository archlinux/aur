# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.2.0
pkgrel=1
pkgdesc="A simple password manager for geeks"
url="https://github.com/conradkleinespel/rooster"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('39e9cc19b3549e77b0434eb6252fa57e6c54dfec6fe12ca0bdb2879a69ae0302')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
  install -Dm755 target/release/rooster-clipboard "$pkgdir/usr/bin/rooster-clipboard"
}
