# Maintainer: Maikel Wever <maikelwever@gmail.com>
# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-executor
pkgver=23.2
pkgrel=2
pkgdesc="Programmer friendly subprocess wrapper"
url="https://github.com/xolox/python-executor"
license=('MIT')
depends=('python' 'python-coloredlogs' 'python-fasteners' 'python-humanfriendly' 'python-property-manager' 'python-six')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/e/executor/executor-${pkgver}.tar.gz")
sha256sums=('e1c6c18ceca9e64f3f9e691bc5271806037c9a96c01e683ce46c03494af6033d')
arch=('any')

build() {
  cd "executor-${pkgver}"

  python setup.py build
}

package() {
  cd "executor-${pkgver}"

  PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-executor/LICENSE.txt"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/python-executor/README.rst"
  install -Dm644 CHANGELOG.rst "${pkgdir}/usr/share/doc/python-executor/CHANGELOG.rst"
}

# vim:set ts=2 sw=2 et:
