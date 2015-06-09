pkgname=mmg3d
pkgver=4.0.1
pkgrel=1
pkgdesc='Anisotropic tetrahedral remesher and moving mesh generator'
url="http://www.math.u-bordeaux1.fr/~cdobrzyn/logiciels/mmg3d.php"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake')
# options=('staticlibs')
source=("https://gforge.inria.fr/frs/download.php/latestfile/4758/${pkgname}4-${pkgver}-Source.tar.gz")
sha256sums=('fc249ce6ed1b20c71804af05213d5a90dcfe6b9e5d679b60623c1b19e1c42568')

build () {
  cd "${pkgname}4-$pkgver-Source"

  # You need Scotch 5.12 to compile with scotch
  cmake \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DUSE_SCOTCH=OFF \
    -DLIBMMG3D4_SHARED=ON \
    -DLIBMMG3D4_STATIC=ON

  make
}

package() {
  cd "${pkgname}4-$pkgver-Source"

  make install
}

# vim: ts=2 sw=2 et
