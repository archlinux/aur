# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=pijul
pkgver=0.3.4
pkgrel=1
pkgdesc="Version control system based on a theory of patches"
url='https://pijul.org'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('a19fb0197a5f05a660b4c3431a9fd8dc03e7e1c4b56e25c00ea1df4409b92cdb')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
