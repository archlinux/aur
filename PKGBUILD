# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cflib
pkgver=0.1.19
pkgrel=1
pkgdesc='Python library to communicate with Crazyflie'
arch=('x86_64')
url='https://github.com/bitcraze/crazyflie-lib-python'
license=('GPL-2.0')
depends=('python' 'python-pyusb' 'python-libusb-package' 'python-scipy'
         'python-numpy' 'python-opencv')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-lib-python/archive/$pkgver.tar.gz")
sha256sums=('15156866803e57417b9c66cbc4e08da99eca5ff166bfc0fdb66378831373cc9a')

_pkgname=crazyflie-lib-python

prepare() {
  sed -i '/opencv/d' ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
