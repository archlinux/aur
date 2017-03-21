# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=pijul
pkgver=0.3.3
pkgrel=1
pkgdesc="Version control system based on a theory of patches"
url='https://pijul.org'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('8929e69d2abb4d5b4e94264ec6885b1a3d6822e5adb33d6a68ae2aa9374ada14')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
