# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=3.0.2
pkgrel=1
pkgdesc="Utility for cargo to compile projects when sources change "
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("https://github.com/passcod/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0925aad5f24f177e780b43a945635096c88efaf945891cf94c02cc712cc7de07')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
}
