# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pyuavcan
pkgver=1.1.3
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
sha256sums=('c548a7b884f15706af73fea1fe120e2796e2766c986e08af20373104242c7ee7')

_pkgname=pyuavcan

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
