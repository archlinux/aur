# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-lmfit
pkgver=0.8.3
pkgrel=1
pkgdesc="Least-Squares Minimization with Constraints for Python"
arch=('any')
url="http://lmfit.github.io/lmfit-py/"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=(https://github.com/lmfit/lmfit-py/archive/${pkgver}.tar.gz)

build() {
  cd "$srcdir/lmfit-py-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/lmfit-py-$pkgver"
  nosetests2 tests
}

package(){
  cd "$srcdir/lmfit-py-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
md5sums=('f5a06cf18611f3dc323e3a1bab8d45fa')
