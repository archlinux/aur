# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgbase=python-mbed-flasher
pkgname=('python-mbed-flasher' 'python2-mbed-flasher')
pkgver=0.10.1
pkgrel=1
pkgdesc='mbed device flasher application'
arch=('any')
url='https://github.com/ARMmbed/mbed-flasher'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5f31a63d47ad82c8a5168e1fe2cea5214ca121bdc2fad504947d894e704a01c6')

package_python-mbed-flasher() {
  depends=(
    'python'
    # dependecies found via
    # 'pip install mbed-flasher; pip show mbed-flasher'
    'python-pyserial'
    'python-mbed-ls'
    'python-six'
  )
  optdepends=(
    'pyocd: for boards using PyOCD'     # flashers/FlasherPyOCD.py
  )

  cd "mbed-flasher-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  python setup.py clean --all
}

package_python2-mbed-flasher() {
  depends=(
    'python2'
    # dependecies found via
    # 'pip install mbed-flasher; pip show mbed-flasher'
    'python2-pyserial'
    'python2-mbed-ls'
    'python2-six'
  )

  cd "mbed-flasher-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  python2 setup.py clean --all
}

# vim:set ts=2 sw=2 et:
