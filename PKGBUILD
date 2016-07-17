# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.1.0
pkgrel=1
pkgdesc="A simple password manager for geeks"
url="https://github.com/conradkleinespel/rooster"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('00fffc19e3edf0e06113665012c6234d77e1653688afdfafc0dfec28a427c947')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
  install -Dm755 target/release/rooster-clipboard "$pkgdir/usr/bin/rooster-clipboard"
}
