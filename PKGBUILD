# Maintainer: Maikel Wever <maikelwever@gmail.com>
# Co-Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-property-manager
pkgver=3.0
pkgrel=3
pkgdesc="Useful property variants for Python programming"
url="https://github.com/xolox/python-property-manager"
arch=('any')
license=('MIT')
depends=('python' 'python-humanfriendly' 'python-verboselogs')
makedepends=('python-setuptools')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('db8dcc5bde9ce6cefa4a47638620c4cc')

build() {
  cd "python-property-manager-${pkgver}"

  python setup.py build
}

package() {
  cd "python-property-manager-${pkgver}"

  PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-property-manager/LICENSE.txt"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/python-property-manager/README.rst"
  install -Dm644 CHANGELOG.rst "${pkgdir}/usr/share/doc/python-property-manager/CHANGELOG.rst"
}

# vim:set ts=2 sw=2 et:
