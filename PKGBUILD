# Maintainer: yoyo58 <yoyo58@localhost>
pkgname=hi
pkgver=0.1.0
pkgrel=1
pkgdesc="Application Rust hi"
arch=('x86_64')
url="https://github.com/yoyo58/hi"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yoyo58/hi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
