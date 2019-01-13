pkgname=mmg3d
pkgver=5.3.11
pkgrel=1
pkgdesc='Anisotropic tetrahedral remesher and moving mesh generator'
url="http://www.mmgtools.org/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake')
source=("https://github.com/MmgTools/mmg/archive/v$pkgver.tar.gz")
sha256sums=('ea7332230f88bd26239d1636944a970cd2aa98b017052215a54201f125e53b9f')

build () {
  cd "mmg-$pkgver"

  cmake \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DLIBMMG2D_SHARED=ON \
    -DLIBMMG3D_SHARED=ON \
    -DLIBMMGS_SHARED=ON \
    -DLIBMMG_SHARED=ON

  make
}

package() {
  cd "mmg-$pkgver"

  make install
}

# vim: ts=2 sw=2 et
