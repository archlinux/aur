# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-mutovis-analysis
_pkgname=analysis-software
pkgver=3.0.0
pkgrel=1
pkgdesc="Python QT batch curve fitting GUI tool for solar cell IV data files"
arch=('any')
url=https://github.com/mutovis/analysis-software
license=('GPL-3.0')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-scipy' 'python-h5py' 'python-sympy' 'python-mpmath' 'python-lmfit' 'python-dill' 'python-pyqt5')
makedepends=('python-setuptools')
source=("https://github.com/mutovis/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8718dde2567cb52a6503df04ccb09f9cbc168e33a6f936600e956b064cb05684')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
