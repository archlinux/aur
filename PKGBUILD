# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python2-pyinsane"
_pkgname="pyinsane"
pkgver="1.4.0"
pkgrel="1"
pkgdesc="Python implementation of the Sane API (using ctypes) and abstration layer"
arch=('any')
url="https://github.com/jflesch/pyinsane"
license=('GPL3')
makedepends=('python2' 'python2-setuptools')
depends=('python2' 'python2-pillow' 'sane')
changelog="ChangeLog"
source=("https://github.com/jflesch/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e0ba69440f366854c26cb4661bf08fdce95eefa4b99a461c5e8d057909210f55')

prepare() {
  msg "Building for python 2"
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

# vim:set ts=2 sw=2 et:
