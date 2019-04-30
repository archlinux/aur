# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-mutovis-analysis
_pkgname=analysis-software
pkgver=3.0.6
pkgrel=2
pkgdesc="Python QT batch curve fitting GUI tool for solar cell IV data files"
arch=('any')
url=https://github.com/mutovis/analysis-software
license=('GPL-3.0')
install=python-mutovis-analysis.install
depends=('python' 'python-numpy' 'python-matplotlib' 'python-scipy' 'python-h5py' 'python-sympy' 'python-mpmath' 'python-lmfit' 'python-dill' 'python-pyqt5' 'python-uncertainties')
makedepends=('python-setuptools')
source=("https://github.com/mutovis/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('45a4ba90e72805d57c291bfdc14329a7841ca0877f54a27d0fd5799ce79170d9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  chmod +x "$pkgdir/usr/bin/h52csv"
}

# vim:ts=2:sw=2:et:
