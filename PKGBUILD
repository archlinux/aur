# Author: Roman Gilg <subdiff@gmail.com>

pkgname=disman-kwinft
pkgver=0.527.0
pkgrel=1
pkgdesc='Qt/C++ display management library'
arch=(x86_64 aarch64)
url="https://gitlab.com/kwinft/disman"
license=(LGPL)
depends=(wrapland kcoreaddons5 qt5-x11extras)
provides=("disman")
conflicts=("disman")
makedepends=(extra-cmake-modules git appstream)
source=("https://gitlab.com/kwinft/disman/-/archive/disman@$pkgver/disman-disman@$pkgver.tar.gz")
sha1sums=('02ab18a807a87124ecb8451db5359f3ec7bfbea6')

prepare() {
  mkdir -p $pkgname
  cd $pkgname
  tar -xvf ../disman-disman@$pkgver.tar.gz --strip-components 1
}
  
build() {
  mkdir -p build
  cd build
  cmake ../$pkgname
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
