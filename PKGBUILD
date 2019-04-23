# Maintainer: Conrad Kleinespel <conradk@conradk.com>

pkgname=rooster
pkgver=2.8.1
pkgrel=1
pkgdesc="A simple password manager for geeks"
url="https://github.com/conradkdotcom/rooster"
makedepends=('cargo' 'pkg-config' 'libx11' 'libxmu' 'python3' 'libsodium' 'openssl')
depends=('libx11' 'libxmu' 'libsodium' 'openssl' 'xsel')
arch=('i686' 'x86_64')
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conradkdotcom/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c9e79f936e230c4812ffe8fdbf019c53e1aed5633bd83a0a507c1b680ac0a681')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rooster "$pkgdir/usr/bin/rooster"
}
