# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=pijul
pkgver=0.5.12
pkgrel=1
pkgdesc="Patch-based distributed version control system"
url='https://pijul.org'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('15eb921e1b449deda9a66ce68614fab88c0e0b22d80b5d69659376ad1607237c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
