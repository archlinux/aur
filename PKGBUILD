# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgbase=python-mbed-icetea
pkgname=('python-mbed-icetea' 'python2-mbed-icetea')
pkgver=2.0.1
pkgrel=1
pkgdesc='mbed test framework'
arch=('any')
url='https://github.com/ARMmbed/icetea'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5c31d2fc60b543f82c59545218a78795a00a6d09412e0c6e8e0e528df398dadb')

package_python-mbed-icetea() {
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

  cd "icetea-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  python setup.py clean --all
}

package_python2-mbed-icetea() {
  depends=(
    'python2'
    'python2-prettytable'
    'python2-requests'
    'python2-yattag'
    'python2-pyserial'
    'python2-jsonmerge'
    'python2-jsonschema'
    'python2-mbed-ls'
    'python2-semver'
    'python2-mbed-flasher'
    'python2-six'
    'python2-pydash'
    'python2-transitions'
  )
  optdepends=(
    'python2-coloredlogs: decorate your console outputs with all kind of colors'
    'python2-psutil'
  )

  cd "icetea-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  python2 setup.py clean --all
}

# vim:set ts=2 sw=2 et:
