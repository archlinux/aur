# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qjson
pkgver=0.9.0
pkgrel=2
pkgdesc="A Qt4-based library that maps JSON data to QVariant objects"
arch=(x86_64)
license=(GPL)
url="http://qjson.sourceforge.net"
depends=(qt4)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::"https://github.com/flavio/qjson/archive/$pkgver.tar.gz")
sha256sums=('e812617477f3c2bb990561767a4cd8b1d3803a52018d4878da302529552610d4')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
