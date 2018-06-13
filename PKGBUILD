pkgname=agrum
pkgver=0.13.2
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('GPL')
arch=('i686' 'x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydotplus' 'python-matplotlib' 'ipython' 'unixodbc')
makedepends=('cmake' 'cococpp' 'python')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('952fa38d7c19a6c8c0119132c409974e078d27fe58d9919a018b1b376fe589e9')

build() {
  cd "$srcdir/aGrUM-$pkgver"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SWIG=OFF ..
  make
}

package() {
  cd "$srcdir/aGrUM-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
