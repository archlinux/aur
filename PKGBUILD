# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=blasfeo
pkgver=0.1.2
pkgdesc="Basic linear algebra subroutines for embedded optimization"
url='https://github.com/giaf/blasfeo'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD 2-Clause')
makedepends=('cmake')
depends=()
source=(https://github.com/giaf/blasfeo/archive/${pkgver}.tar.gz)
sha256sums=('079c9c90db1249aac59fa649c42667d46f4d458049e5986762035388f22fc005')

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBLASFEO_EXAMPLES=OFF

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
