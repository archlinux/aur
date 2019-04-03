# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-mutovis-control
_pkgname=control-software
pkgver=1.1.3
pkgrel=1
pkgdesc="Software for collecting electrical characterization data for solar cells"
arch=('any')
url=https://github.com/mutovis/control-software
license=('GPL-3.0')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pyserial' 'python-h5py' 'python-pyvisa' 'python-pyvisa-py' 'python-mpmath' 'python-pyftdi')
makedepends=('python-setuptools')
backup=('etc/gpib.conf' 'usr/etc/gpib.conf')
source=("https://github.com/mutovis/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('04ce31ffd30d8eeed111fbbab754bf71c7e661ea18fbe75ece233315ca2fc747')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
