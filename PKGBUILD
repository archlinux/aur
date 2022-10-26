# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=librtprocess
pkgver=0.12.0
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Library for raw image processing"
url="https://github.com/CarVac/librtprocess"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'openmp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2eaaff9d9365b97cfb76cef36c0ba53d9b556f45d49bdcc84947ef3bf513240cec13d763ae7fc78589c2b68a739ed23477f6953a7329d8177275f81e5e588ddf')

prepare() {
  mkdir -p $pkgname-$pkgver/build
}

build() {
  cd $pkgname-$pkgver/build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
