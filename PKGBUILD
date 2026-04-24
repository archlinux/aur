# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.14.1
pkgrel=1
pkgdesc="A simple password manager"
url="https://github.com/conradkleinespel/rooster"
makedepends=('cargo' 'pkg-config' 'libx11' 'libxmu' 'python3')
depends=('libx11' 'libxmu' 'xsel' 'wl-clipboard')
arch=('i686' 'x86_64')
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conradkleinespel/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
}
