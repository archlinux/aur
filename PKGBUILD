# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=pijul
pkgver=0.4.1
pkgrel=1
pkgdesc="Version control system based on a theory of patches"
url='https://pijul.org'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('38f84f8e75ceefa352e58c99524c827bcae43f3ca3b9b21f4d3d468606d08494')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
