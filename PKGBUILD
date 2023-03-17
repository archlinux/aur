pkgname=agrum
pkgver=1.7.0
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('LGPL')
arch=('x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydot' 'python-matplotlib' 'python-six' 'ipython' 'python-ipykernel' 'python-pandas' 'python-scikit-learn' 'python-cairosvg' 'unixodbc')
makedepends=('cmake')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('d15f98239c326eeb1fe42f8dd64f229bda3c1725a39fe53e4f603dadfb87db38')

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
