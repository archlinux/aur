# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.14.1
pkgrel=2
pkgdesc="A simple password manager"
url="https://github.com/conradkleinespel/rooster"
makedepends=('cargo' 'pkg-config' 'libx11' 'libxmu' 'python3')
depends=('libx11' 'libxmu' 'xsel' 'wl-clipboard')
arch=('i686' 'x86_64')
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conradkleinespel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d25b2b25aa655f7b029afba2377e480aaf8702f6668fea494023a70f61c9f5dd')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
}
