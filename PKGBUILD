# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.7.1
pkgrel=1
pkgdesc="A simple password manager for geeks"
url="https://github.com/conradkdotcom/rooster"
makedepends=('cargo' 'pkg-config' 'libx11' 'libxmu' 'python3')
arch=('i686' 'x86_64')
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conradkdotcom/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b1413d220f240e9f9fc99e3be705c029a10f82e67df2858ee15ba09c3f5c1b51')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
}
