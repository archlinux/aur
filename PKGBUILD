# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=ip2location
_pname=IP2Location
pkgname=python-${_pkgname}
pkgver=8.6.4
pkgrel=1
pkgdesc='A Python Library to reads the geo location information by IP address.'
url='https://pypi.org/project/IP2Location'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-mock' 'python-pytest-timeout')
source=(${_pname}-Python-${pkgver}.tar.gz::"https://github.com/chrislim2888/IP2Location-Python/archive/${pkgver}.tar.gz")
sha512sums=('c423a3eeae2211c7175fa27411e3a0df543e6cd4c1b2a666e4e73173654a84fc9d6e73649e0b7af3f377af017df1ee697cee5a67b99a1e16eb381e34feb99580')

build() {
  cd ${_pname}-Python-${pkgver}
  python setup.py build
}

check() {
  cd ${_pname}-Python-${pkgver}
  python setup.py test
}

package() {
  cd ${_pname}-Python-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
