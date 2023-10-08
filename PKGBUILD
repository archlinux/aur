pkgname=prima
pkgver=0.7.2
pkgrel=1
pkgdesc="package for solving general nonlinear optimization problems without using derivatives"
license=('BSD')
arch=('x86_64')
url="https://github.com/libprima/prima"
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran')
source=("https://github.com/libprima/prima/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b2cc3547e5601de494267d501f7a8ad2b42482d189c647e312c41917d81ed8e7')

build() {
  cd prima-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B .
  make
}

package() {
  cd prima-$pkgver
  make DESTDIR="$pkgdir" install
}

