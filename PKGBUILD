# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=elemental
pkgver=0.84
pkgrel=1
url="http://libelemental.org"
pkgdesc="distributed-memory dense linear algebra"
makedepends=('cmake')
depends=('lapack')
arch=('i686' 'x86_64')
license=("BSD")
source=("http://libelemental.org/pub/releases/Elemental-${pkgver}.tgz")
md5sums=('eb0b1bc7d8ddd15ac2a290a2f9d6573b')

build() {
  cd "${srcdir}/Elemental-${pkgver}"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DELEM_SHARED_LIBRARIES=ON ..
  make
}

package() {
  cd "${srcdir}/Elemental-${pkgver}/build"
  make install DESTDIR="$pkgdir"
}

