pkgname=agrum
pkgver=0.22.4
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('LGPL')
arch=('x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydotplus' 'python-matplotlib' 'python-six' 'ipython' 'python-ipykernel' 'unixodbc')
makedepends=('cmake')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('0f9746e7de7221e68e05da631992bf042432b2efb480ecc1d2e2a5df51090612')

build() {
  cd "$srcdir/aGrUM-$pkgver"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_PYTHON=ON ..
  make
}

package() {
  cd "$srcdir/aGrUM-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
