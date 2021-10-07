# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pyuavcan
pkgver=1.2.9
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
sha256sums=('14a3ea27d449e57b328b8012b043bf0942d412c94f7b496deaeb0d6c72beeb52')

_pkgname=pyuavcan

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
