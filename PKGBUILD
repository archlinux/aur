# maintainer: asitos @ https://github.com/asitos
# PKGBUILD
pkgname=haj
pkgver=0.2.1
pkgrel=1
pkgdesc="fast, quiet, beautiful package management for blahArch Linux"
arch=('x86_64')
url="https://github.com/asitos/haj"
license=('MIT')
depends=('pacman' 'libalpm.so' 'display3d')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c15d36db6a181ed5cc12ca6db582f9e67722d165f6670be4774dd9640a507d03')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/haj" "$pkgdir/usr/bin/haj"
}
