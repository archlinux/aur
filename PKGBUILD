# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-mutovis-control
_pkgname=control-software
pkgver=1.0.2
pkgrel=1
pkgdesc="Software for collecting electrical characterization data for solar cells"
arch=('any')
url=https://github.com/mutovis/control-software
license=('GPL-3.0')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pyserial' 'python-h5py' 'python-pyvisa' 'python-pyvisa-py' 'python-mpmath')
makedepends=('python-setuptools')
source=("https://github.com/mutovis/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3bb0c32c7ed79f672762e1644c69f2ef44c0819a22f3ba9d4a142a5ce10850b4')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
