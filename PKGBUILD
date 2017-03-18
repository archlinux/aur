# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=pijul
pkgver=0.3
pkgrel=1
pkgdesc="Version control system based on a theory of patches"
url='https://pijul.org'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL')
source=("$url/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('2c7b354b4ab142ac50a85d70c80949ff864377b37727b862d103d3407e2c7818')

build() {
  cd "$pkgname/$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname/$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
