# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cflib
pkgver=0.1.16
pkgrel=1
pkgdesc='Python library to communicate with Crazyflie'
arch=('x86_64')
url='https://github.com/bitcraze/crazyflie-lib-python'
license=('GPL-2.0')
depends=('python' 'python-pyusb' 'python-opencv')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-lib-python/archive/$pkgver.tar.gz")
sha256sums=('8b992375f0213d540af81db56d7631c92bd1fa4cf7ac9b57d2789cddc6dcd1a0')

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
