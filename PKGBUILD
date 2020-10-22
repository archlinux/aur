pkgname=muq
pkgver=2
pkgrel=1
pkgdesc="MIT Uncertainty Quantification Library"
license=('MIT')
arch=('x86_64')
url="http://muq.mit.edu/"
depends=('boost-libs' 'nlopt' 'python' 'sundials' 'nlopt')
makedepends=('cmake' 'eigen' 'nanoflann')
source=("git+https://bitbucket.org/mituq/muq2.git")
sha256sums=(SKIP)

prepare() {
  cd muq2 
}

build() {
  cd muq2
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        .
  make
}

package() {
  cd muq2
  make DESTDIR="$pkgdir" install
}
