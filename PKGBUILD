pkgname=agrum
pkgver=0.17.1
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('LGPL')
arch=('i686' 'x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydotplus' 'python-matplotlib' 'python-six' 'ipython' 'unixodbc')
makedepends=('cmake')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('a6f14e9ad08b6123c316cf8b8e1bedc747c481a7ff15f92037b56c072aa3739b')

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
