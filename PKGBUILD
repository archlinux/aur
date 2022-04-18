# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pyuavcan
pkgver=1.5.0
pkgrel=1
pkgdesc='Python implementation of the UAVCAN protocol stack.'
arch=('x86_64')
url='https://pyuavcan.readthedocs.io'
license=('MIT')
depends=('python' 'python-pydsdl' 'python-numpy' 'python-nunavut')
optdepends=('python-can' 'python-pyserial' 'python-ruamel-yaml'
            'python-requests' 'python-simplejson')
makedepends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/UAVCAN/pyuavcan/archive/$pkgver.tar.gz")
sha256sums=('6f4f293647d4a0421764ada3f02ca4bdcab65613542a8b11bf52cdab95a8e584')

_pkgname='pycyphal'

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
