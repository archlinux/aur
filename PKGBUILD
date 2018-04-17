# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=6.0.0
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d9bb8127f0e45741c1e93c7a9f066cc0c25bcb10ea1d0a92127b5647bd80c84d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
