pkgname=agrum
pkgver=1.5.1
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('LGPL')
arch=('x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydot' 'python-matplotlib' 'python-six' 'ipython' 'python-ipykernel' 'python-pandas' 'python-scikit-learn' 'python-cairosvg' 'unixodbc')
makedepends=('cmake')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('fefa6a870c8dcce254b3cfca548808e68329fcc4f2715df30446b092beb464bc')

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
