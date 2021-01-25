# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.9.0
pkgrel=1
pkgdesc="A simple password manager for geeks"
url="https://github.com/conradkleinespel/rooster"
makedepends=('cargo' 'pkg-config' 'libx11' 'libxmu' 'python3' 'libsodium' 'openssl')
depends=('libx11' 'libxmu' 'libsodium' 'openssl' 'xsel' 'wl-clipboard')
arch=('i686' 'x86_64')
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conradkleinespel/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2cb08c90c9604951c810038dffd1dfca1de71bfe1d76b22f951dc3f14c0efab4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
}
