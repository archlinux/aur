pkgname=prima
pkgver=0.7
pkgrel=1
pkgdesc="package for solving general nonlinear optimization problems without using derivatives"
license=('BSD')
arch=('x86_64')
url="https://github.com/libprima/prima"
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran')
source=("https://github.com/libprima/prima/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2afba2bb98538d3f7123ae17726758675e3d76287e279fdb9b0de93ac13d1de0')

build() {
  cd prima-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B .
  make
}

package() {
  cd prima-$pkgver
  make DESTDIR="$pkgdir" install
}

