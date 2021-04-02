# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-mbed-icetea
pkgver=2.0.1
pkgrel=2
pkgdesc='mbed test framework'
arch=('any')
url='https://github.com/ARMmbed/icetea'
license=('Apache')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-prettytable'
  'python-requests'
  'python-yattag'
  'python-pyserial'
  'python-jsonmerge'
  'python-jsonschema'
  'python-mbed-ls'
  'python-semver'
  'python-mbed-flasher'
  'python-six'
  'python-pydash'
  'python-transitions'
)
optdepends=(
  'python-coloredlogs: decorate your console outputs with all kind of colors'
  'python-psutil'
  'python-pyshark: sniffer integration'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5c31d2fc60b543f82c59545218a78795a00a6d09412e0c6e8e0e528df398dadb')

package() {
  cd "icetea-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  python setup.py clean --all
}

# vim:set ts=2 sw=2 et:
