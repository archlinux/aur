# Author: Roman Gilg <subdiff@gmail.com>
# Maintainer: abelian424

pkgname=disman-kwinft
pkgver=0.600.0
pkgrel=1
pkgdesc='Qt/C++ display management library'
arch=(x86_64 aarch64)
url="https://github.com/winft/disman"
license=(LGPL)
depends=('wrapland' kcoreaddons kwayland)
provides=('disman')
conflicts=('disman')
makedepends=(extra-cmake-modules git appstream)
source=("https://github.com/winft/disman/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('d22b6f94204d35c003980c1b7baa2a3beaa98cc3')

prepare() {
  mkdir -p $pkgname
  cd $pkgname
  tar -xvf ../v$pkgver.tar.gz --strip-components 1
}
  
build() {
  mkdir -p build
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
