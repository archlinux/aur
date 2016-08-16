# Maintainer: Jose Riha <jose1711 gmail com>
# based on python-pyfiglet in aur

pkgname=python2-pyfiglet
pkgver=0.7.4
pkgrel=1
pkgdesc="An implementation of figlet written in python (python2)"
url="https://github.com/pwaller/pyfiglet"
license=('GPL2')
arch=('any')
depends=('python2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/pyfiglet/pyfiglet-${pkgver}.tar.gz)
sha512sums=('9894ee4d1b7dfc8d438cd263b53bb11abff3889d6e20ef6915810a693507b1ecc6663bdfb0b9703291f16228bf62ce0ce54caee51ffa00cd3221f7a447e3ab1d')


build() {
  cd "$srcdir/pyfiglet-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/pyfiglet-${pkgver}/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv ${pkgdir}/usr/bin/pyfiglet ${pkgdir}/usr/bin/pyfiglet_py2
}

# vim:set ts=2 sw=2 et:
