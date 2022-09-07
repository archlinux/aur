# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cflib
pkgver=0.1.20.1
pkgrel=1
pkgdesc='Python library to communicate with Crazyflie'
arch=('x86_64')
url='https://github.com/bitcraze/crazyflie-lib-python'
license=('GPL-2.0')
depends=('python' 'python-pyusb' 'python-libusb-package' 'python-scipy'
         'python-numpy' 'python-opencv')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-lib-python/archive/$pkgver.tar.gz")
sha256sums=('8afcaaab32971edea378c9068ded01630c2f72574378da9cb59bb94ff0b8d2d0')

_pkgname=crazyflie-lib-python

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
