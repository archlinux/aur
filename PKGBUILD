# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.7.0
pkgrel=1
pkgdesc="A simple password manager for geeks"
url="https://github.com/conradkdotcom/rooster"
makedepends=('cargo' 'pkg-config' 'libx11' 'libxmu' 'python3')
arch=('i686' 'x86_64')
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conradkdotcom/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8d273666af02f0643aec6c85ad347fa4008a476060e53bf40afe5cea429a7551')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
}
