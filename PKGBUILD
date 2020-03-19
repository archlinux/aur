# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=mavlink
pkgver=1.0.12
pkgdesc="Marshalling / communication library for drones."
url='https://mavlink.io'
arch=('i686' 'x86_64')
pkgrel=1
license=('GPLv3')
makedepends=('cmake')
depends=('python' 'python-future' 'python-pymavlink')
optdepends=()
source=("${pkgname}-${pkgver}::https://github.com/mavlink/mavlink/archive/${pkgver}.tar.gz")
sha256sums=('940ac31416d826f959d7f62fd4696ce6f23cf3e8c71c80a678a33ad93b4bf66d')

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
