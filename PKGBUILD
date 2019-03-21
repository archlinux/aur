# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-mutovis-control
_pkgname=control-software
pkgver=1.1.0
pkgrel=1
pkgdesc="Software for collecting electrical characterization data for solar cells"
arch=('any')
url=https://github.com/mutovis/control-software
license=('GPL-3.0')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pyserial' 'python-h5py' 'python-pyvisa' 'python-pyvisa-py' 'python-mpmath' 'python-pyftdi')
makedepends=('python-setuptools')
backup=('etc/gpib.conf' 'usr/etc/gpib.conf')
source=("https://github.com/mutovis/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('88a33083e031185666a1eb312105ff695c8df5c344c433c657ed81ec6f8f8297')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
