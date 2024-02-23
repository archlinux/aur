# Maintainer: Paul Irofti <paul@irofti.net>
_name=macaddress
pkgname="python-$_name"
pkgver=2.0.2
pkgrel=1
pkgdesc="handling hardware identifiers like MAC addresses"
arch=('any')
url="https://github.com/mentalisttraceur/python-macaddress"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1400ccdc28d747102d57ae61e5b78d8985872930810ceb8860cd49abd1e1fa37')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
