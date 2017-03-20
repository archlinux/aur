# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=pijul
pkgver=0.3.2
pkgrel=1
pkgdesc="Version control system based on a theory of patches"
url='https://pijul.org'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('c53821770484f49fc8bba4b51ba5afbe903aaa4f421f2669c7e570b543ecce28')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
