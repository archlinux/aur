# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=pijul
pkgver=0.5.9
pkgrel=1
pkgdesc="Patch-based distributed version control system"
url='https://pijul.org'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('4f674fbd72dd813cc0a0c96067655045a8f6c1a8c62d38e332bb6d3a9a5e207c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
