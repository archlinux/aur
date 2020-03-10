# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-lmfit
pkgver=1.0.0
pkgrel=1
pkgdesc="Non-Linear Least Squares Minimization, with flexible Parameter settings, based on scipy.optimize.leastsq, and with many additional classes and methods for curve fitting"
arch=('any')
url=http:/lmfit.github.io/lmfit-py/
license=('BSD-3')
depends=('python' 'python-numpy' 'python-scipy' 'python-asteval' 'python-uncertainties')
makedepends=(python-setuptools)
source=(https://github.com/lmfit/lmfit-py/archive/${pkgver}.tar.gz)
sha256sums=('a97f3ea280eed161c59fbb59362c6320120e3aaf2b24a07421b3c69f9c4dfdf7')

build() {
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
