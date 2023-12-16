# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ruckig
pkgver=0.9.2
pkgdesc="Motion Generation for Robots and Machines. Real-time. Jerk-constrained.
Time-optimal."
url='https://ruckig.com/'
arch=('i686' 'x86_64')
pkgrel=1
license=('MIT')
makedepends=('cmake')
depends=()
source=(https://github.com/pantor/ruckig/archive/v${pkgver}.tar.gz)
sha256sums=('9207db22604881b146ca2fbe79916ff4290c53eb5b46a0f3bbc606fb74bee13c')

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
