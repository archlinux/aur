# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=hass-nabucasa
pkgname=python-hass-nabucasa
pkgver=0.50.0
pkgrel=1
pkgdesc='Home Assistant cloud integration by Nabu Casa, Inc.'
url='https://github.com/NabuCasa/hass-nabucasa'
arch=('any')
license=('GPL-3.0')
depends=('python')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-mock' 'python-pytest-timeout')
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/NabuCasa/hass-nabucasa/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('82cd34aabf127c3f5097d7fb55f3f50b7c9e236fa3889e9e30998dc7b07a0aad')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  python setup.py test
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
