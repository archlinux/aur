# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-mutovis-control
_pkgname=control-software
pkgver=1.2.2
pkgrel=1
pkgdesc="Software for collecting electrical characterization data for solar cells"
arch=('any')
url=https://github.com/mutovis/control-software
license=('GPL-3.0')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pyserial' 'python-h5py' 'python-pyvisa' 'python-pyvisa-py' 'python-mpmath' 'python-pyftdi' 'python-setuptools-scm-git-archive' 'python-setuptools-scm')
install=python-mutovis-control.install
makedepends=('python-setuptools')
backup=('etc/gpib.conf' 'usr/etc/gpib.conf')
source=("https://github.com/mutovis/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0f06fca86d0427461494bfd3cb76d6b8a91fc2c3fedc87eb9e14ad2a0e2fe334')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
