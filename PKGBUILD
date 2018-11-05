# Maintainer: Martin Fracker <martin.frackerjr@gmail.com>
pkgname=fruit-di
pkgver=3.4.0
pkgrel=1
pkgdesc="A dependency injection library for C++"
arch=("x86_64")
url="https://github.com/google/fruit/releases"
license=("Apache")
source=("https://github.com/google/fruit/archive/v$pkgver.tar.gz")
sha256sums=("0f3793ee5e437437c3d6360a037866429a7f1975451fd60d740f9d2023e92034")

build() {
  cd "fruit-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DCMAKE_BUILD_TYPE=Release -DFRUIT_USES_BOOST=False .
  make
}

package() {
  cd "fruit-$pkgver"
  make install
}
