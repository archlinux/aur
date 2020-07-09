# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cflib
pkgver=0.1.11
pkgrel=1
pkgdesc='Python library to communicate with Crazyflie'
arch=('x86_64')
url='https://github.com/bitcraze/crazyflie-lib-python'
license=('GPL-2.0')
depends=('python' 'python-pyusb')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-lib-python/archive/$pkgver.tar.gz")
sha256sums=('5cdabc0d9460f4d39dbd63e3c158cf2a6089cd810ab15d0bb4c67e6474ad825c')

_pkgname=crazyflie-lib-python

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
