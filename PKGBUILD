# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-lmfit
pkgver=1.0.2
pkgrel=1
pkgdesc="Non-Linear Least Squares Minimization, with flexible Parameter settings, based on scipy.optimize.leastsq, and with many additional classes and methods for curve fitting"
arch=(x86_64)
url=http:/lmfit.github.io/lmfit-py/
license=(BSD)
depends=('python' 'python-numpy' 'python-scipy' 'python-asteval' 'python-uncertainties')
makedepends=(python-setuptools)
source=(https://github.com/lmfit/lmfit-py/archive/${pkgver}.tar.gz)
sha256sums=('9a67e6ec2e26a941889f4e45420258d46d6da3595846569682974d8702d8c6e4')

build() {
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
