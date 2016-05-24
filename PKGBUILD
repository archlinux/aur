# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-lmfit
pkgver=0.9.3
pkgrel=1
pkgdesc="Least-Squares Minimization with Constraints for Python"
arch=('any')
url="http://lmfit.github.io/lmfit-py/"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/lmfit/lmfit-py/archive/${pkgver}.tar.gz)

build() {
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/lmfit-py-$pkgver"
  nosetests3 tests
}

package(){
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
md5sums=('440d681d1c4dbc0b8c40ef66cc0300f8')
