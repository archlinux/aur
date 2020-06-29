# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=python-fbs
_name=fbs
pkgver=0.8.6
pkgrel=1
pkgdesc="Python and Qt-based lightweight alternative to Electron"
arch=('any')
url="https://build-system.fman.io/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz"::"https://github.com/mherrmann/fbs/archive/v${pkgver}.tar.gz")
sha256sums=('5ea208705e1190f01d0b12a1be81e6ff8f6a36cc7f22a4e35d176350b26070ee')
sha512sums=('12d2b6ef9515cb363617dd479ba2f021ef89d27cfd580e8c445a70b01ea8088dd25e7ae6128230a048bb1e8bdb25dbfeaca13113a6fb1feefb050157f66cb17c')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
