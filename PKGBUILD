pkgname=elemental
pkgver=0.85
pkgrel=1
url="http://libelemental.org"
pkgdesc="distributed-memory dense linear algebra"
makedepends=('cmake')
depends=('lapack')
arch=('i686' 'x86_64')
license=("BSD")
source=("http://libelemental.org/pub/releases/Elemental-${pkgver}.tgz")
md5sums=('b2d70758ad03e3f532010bd621bf9591')

build() {
  cd "${srcdir}/Elemental-${pkgver}"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_PYTHON_PACKAGE=0 ..
  make
}

package() {
  cd "${srcdir}/Elemental-${pkgver}/build"
  make install DESTDIR="$pkgdir"
}

