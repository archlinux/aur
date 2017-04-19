# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=pijul
pkgver=0.5.2
pkgrel=1
pkgdesc="Patch-based distributed version control system"
url='https://pijul.org'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('642abcbdf911bf2267d25629655333b3cdd87776a9bc32377e324260bed47c12')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
