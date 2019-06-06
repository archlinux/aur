# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-lmfit
pkgver=0.9.13
pkgrel=1
pkgdesc="Non-Linear Least Squares Minimization, with flexible Parameter settings, based on scipy.optimize.leastsq, and with many additional classes and methods for curve fitting"
arch=('any')
url=http:/lmfit.github.io/lmfit-py/
license=('BSD-3')
depends=('python' 'python-numpy' 'python-scipy' 'python-asteval')
makedepends=(python-setuptools)
source=(https://github.com/lmfit/lmfit-py/archive/${pkgver}.tar.gz)
sha256sums=('b604afca0aaa23b28170065853b59d6e4c585c367e537b769813af313f8ebeed')

build() {
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
