# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-mutovis-analysis
_pkgname=analysis-software
pkgver=3.0.7
pkgrel=1
pkgdesc="Python QT batch curve fitting GUI tool for solar cell IV data files"
arch=('any')
url=https://github.com/mutovis/analysis-software
license=('GPL-3.0')
install=python-mutovis-analysis.install
depends=('python' 'python-numpy' 'python-matplotlib' 'python-scipy' 'python-h5py' 'python-sympy' 'python-mpmath' 'python-lmfit' 'python-dill' 'python-pyqt5' 'python-uncertainties' 'python' 'python-setuptools-scm-git-archive' 'python-setuptools-scm')
makedepends=('python-setuptools')
source=("https://github.com/mutovis/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('857433ca5090eb9ca031b206f88746e7b2e00117055806b0ed3bca1a7efe5bca')

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
