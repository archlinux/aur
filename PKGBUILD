pkgname=prima
pkgver=0.7.1
pkgrel=1
pkgdesc="package for solving general nonlinear optimization problems without using derivatives"
license=('BSD')
arch=('x86_64')
url="https://github.com/libprima/prima"
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran')
source=("https://github.com/libprima/prima/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('52bc192444b4ebd07c82ef940a01cfe072e8ae2813a84523ec0df55353de7774')

build() {
  cd prima-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B .
  make
}

package() {
  cd prima-$pkgver
  make DESTDIR="$pkgdir" install
}

