# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-lmfit
pkgver=0.9.14
pkgrel=1
pkgdesc="Non-Linear Least Squares Minimization, with flexible Parameter settings, based on scipy.optimize.leastsq, and with many additional classes and methods for curve fitting"
arch=('any')
url=http:/lmfit.github.io/lmfit-py/
license=('BSD-3')
depends=('python' 'python-numpy' 'python-scipy' 'python-asteval' 'python-uncertainties')
makedepends=(python-setuptools)
source=(https://github.com/lmfit/lmfit-py/archive/${pkgver}.tar.gz)
sha256sums=('4a175d4967fae218695178a750119bbabaec2a7b1dc66201b14ecb830c937f30')

build() {
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
