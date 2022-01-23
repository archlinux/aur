# Maintainer: Maikel Wever <maikelwever@gmail.com>
# Co-Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-verboselogs
pkgver=1.7
pkgrel=5
pkgdesc="Verbose logging level for Python's logging module"
url="https://github.com/xolox/python-verboselogs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/xolox/python-verboselogs/archive/${pkgver}.tar.gz")
md5sums=('105744f2c5b43200f2211d526a691289')
arch=('any')

build() {
  cd "python-verboselogs-$pkgver"

  python setup.py build
}

package() {
  cd "python-verboselogs-$pkgver"

  PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-verboselogs/LICENSE.txt"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/python-verboselogs/README.rst"
}

# vim:set ts=2 sw=2 et:
