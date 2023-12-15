pkgname=libmixmod
pkgver=2.1.10
pkgrel=1
pkgdesc="Classification with Mixture Modelling"
arch=('x86_64')
url="https://github.com/mixmod"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'eigen')
source=("https://github.com/mixmod/mixmod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0bc339f36ec22080a8a270ea87976f7b277ce4e3e9e383fba51548f83aa4d0b')

build () {
  cd "$srcdir"/mixmod-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_UNITY_BUILD=ON .
  make
}

package () {
  cd "$srcdir"/mixmod-${pkgver}
  make install DESTDIR="$pkgdir"
}
