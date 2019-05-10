pkgname=agrum
pkgver=0.15.0
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('LGPL')
arch=('i686' 'x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydotplus' 'python-matplotlib' 'ipython' 'unixodbc')
makedepends=('cmake')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('c6b96319e27c6ba1a58973fb75c014cc19786513574a48dc7583a7cb15426f55')

build() {
  cd "$srcdir/aGrUM-$pkgver"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/aGrUM-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
