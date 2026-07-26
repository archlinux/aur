# maintainer: asitos @ https://github.com/asitos
# PKGBUILD
pkgname=haj
pkgver=0.2.4
pkgrel=1
pkgdesc="fast, quiet, beautiful package manager and tui for blahArch"
arch=('x86_64')
url="https://github.com/asitos/haj"
license=('MIT')
depends=('pacman' 'libalpm.so' 'display3d')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3e83fe82e3733d225f346b43dd8d439cbe4312d3fbcbfd7779409de967ad95e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release 
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/haj" "$pkgdir/usr/bin/haj"
}
