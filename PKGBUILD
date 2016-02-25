pkgname=muq
pkgver=0.2
pkgrel=1
pkgdesc="MIT Uncertainty Quantification Library"
license=('MIT')
arch=('i686' 'x86_64')
url="http://muq.mit.edu/"
depends=('boost' 'nlopt' 'hdf5' 'sundials' 'flann')
makedepends=('cmake' 'eigen')
source=("https://bitbucket.org/mituq/muq/downloads/MUQ-v${pkgver}.tar.gz")
sha1sums=('f164c996ce3232da526d6f9f30b8348f38a113cd')

build() {
  cd MUQ
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        .
  make
}

package() {
  cd MUQ
  make DESTDIR="$pkgdir" install
}