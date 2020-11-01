# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-lmfit
pkgver=1.0.1
pkgrel=1
pkgdesc="Non-Linear Least Squares Minimization, with flexible Parameter settings, based on scipy.optimize.leastsq, and with many additional classes and methods for curve fitting"
arch=(x86_64)
url=http:/lmfit.github.io/lmfit-py/
license=(BSD)
depends=('python' 'python-numpy' 'python-scipy' 'python-asteval' 'python-uncertainties')
makedepends=(python-setuptools)
source=(https://github.com/lmfit/lmfit-py/archive/${pkgver}.tar.gz)
sha256sums=('d271096aede53830a3af3017f5cccd742e8f23445187f5ba1595e07ae1b980aa')

build() {
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
