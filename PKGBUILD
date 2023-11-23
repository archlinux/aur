pkgname=libmixmod
pkgver=2.1.9
pkgrel=1
pkgdesc="Classification with Mixture Modelling"
arch=('x86_64')
url="https://github.com/mixmod"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'eigen')
source=("https://github.com/mixmod/mixmod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a4bf19e642386d1c8a36365b537a12636f883bcdeb3a72b698947430f676541')

build () {
  cd "$srcdir"/mixmod-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_UNITY_BUILD=ON .
  make
}

package () {
  cd "$srcdir"/mixmod-${pkgver}
  make install DESTDIR="$pkgdir"
}
