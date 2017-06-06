# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rdedup
pkgver=1.0.2
pkgrel=1
pkgdesc="Data deduplication engine, supporting optional compression and public key encryption"
url='https://github.com/dpc/rdedup'
depends=('libsodium')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MPL')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('05ffcc2b155137d3ffa72b90253141a0aceb62e582d85a5be3862201d3ef4498')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
