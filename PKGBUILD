pkgname=libmixmod
pkgver=2.1.11
pkgrel=1
pkgdesc="Classification with Mixture Modelling"
arch=('x86_64')
url="https://github.com/mixmod"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'eigen')
source=("https://github.com/mixmod/mixmod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e95414decf5b2c2c5eebd7fca10e0100f2d753cbfca0694f4ac75da3b39b005e')

build () {
  cd "$srcdir"/mixmod-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_UNITY_BUILD=ON .
  make
}

package () {
  cd "$srcdir"/mixmod-${pkgver}
  make install DESTDIR="$pkgdir"
}
