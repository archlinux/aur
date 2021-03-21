# Maintainer: Guillaume Dolle  <dev at gdolle.com>
pkgname=filesystem-cpp
pkgver=1.5.2
pkgrel=1
pkgdesc="C++ header-only single-file std filesystem compatible helper library, ghc"
arch=('i686' 'x86_64')
url="https://github.com/gulrak/filesystem"
license=('MIT')
depends=('gcc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/gulrak/filesystem/archive/v${pkgver}.tar.gz)
md5sums=('2104e4da3a9be52f496b51fa3248df8d')

prepare(){
  cd ${pkgname//-cpp}-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -B build
}

build() {
  cd ${pkgname//-cpp}-${pkgver}
  cmake --build build
}

check() {
  cd ${pkgname//-cpp}-${pkgver}/build
  ctest
}

package() {
  cd ${pkgname//-cpp}-${pkgver}
  cmake --install build
}


