# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cflib
pkgver=0.1.17
pkgrel=1
pkgdesc='Python library to communicate with Crazyflie'
arch=('x86_64')
url='https://github.com/bitcraze/crazyflie-lib-python'
license=('GPL-2.0')
depends=('python' 'python-pyusb' 'python-opencv')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-lib-python/archive/$pkgver.tar.gz")
sha256sums=('5bcd3e1ffefeb293dcdcde46674ffddab1bfa11fd9837bdbfd2632f346634b9b')

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
