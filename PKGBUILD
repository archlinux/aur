# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=aracrypt
pkgver=0.1.0
pkgrel=1
pkgdesc="PE encryptor for Linux — encrypts Windows executables into self-decrypting containers"
arch=('x86_64')
url="https://github.com/kvunoff/aracrypt"
license=('MIT' 'BSD')
depends=('fasm')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/aracrypt "$pkgdir/usr/bin/aracrypt"
}
