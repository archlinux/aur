# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mmg3d
pkgver=5.4.1
pkgrel=1
pkgdesc='Anisotropic tetrahedral remesher and moving mesh generator'
url="http://www.mmgtools.org/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake')
source=("https://github.com/MmgTools/mmg/archive/v$pkgver.tar.gz")
sha256sums=('eb8782a6c418af30563a6bd463b465036e953f951fa363886a9e27ef8207f93a')

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
