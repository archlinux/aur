pkgname=agrum
pkgver=0.10.4
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('GPL')
arch=('i686' 'x86_64')
url="https://forge.lip6.fr/projects/aGrUM/wiki"
depends=('python-pydotplus' 'python-matplotlib' 'ipython')
makedepends=('cmake' 'cococpp' 'swig' 'python')
source=("agrum-${pkgver}::git+git://forge.lip6.fr/aGrUM#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
