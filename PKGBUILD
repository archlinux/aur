# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=librtprocess
pkgver=0.12.0.r1724
_commit=9a858270acb2096e2e403d932760ee688fcac425
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Library for raw image processing"
url="https://github.com/CarVac/librtprocess"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'openmp')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('SKIP')

prepare() {
  mkdir -p $pkgname-$_commit/build
}

build() {
  cd $pkgname-$_commit/build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	..
  make
}

package() {
  cd $pkgname-$_commit/build
  make DESTDIR="$pkgdir" install
}
