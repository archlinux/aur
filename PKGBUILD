pkgname=otmorris
pkgver=0.16
pkgrel=1
pkgdesc="Morris sensitivity method module"
license=('LGPL')
arch=('x86_64')
url="http://www.openturns.org/"
depends=('openturns')
makedepends=('cmake' 'swig')
source=("https://github.com/openturns/otmorris/archive/v$pkgver.tar.gz")
sha256sums=('c1fb7358dc2132ebd8a8b39ac55e3cba2ba30a65af4dbc6c97453eb58cb7fff5')

build() {
  cd otmorris-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_UNITY_BUILD=ON \
        -DUSE_SPHINX=OFF \
        .
  make
}

package() {
  cd otmorris-$pkgver
  make DESTDIR="$pkgdir" install
}

