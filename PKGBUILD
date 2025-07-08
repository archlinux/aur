# insmtr: insmtr <insmtr@insmtr.cn>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pymavlink
pkgver=2.4.47
pkgrel=1
pkgdesc='python MAVLink interface and utilities'
arch=('any')
url='https://github.com/ArduPilot/pymavlink/'
license=('LGPL v3')
depends=(python python-lxml python-cython)
makedepends=(python python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/p/pymavlink/pymavlink-${pkgver}.tar.gz")
sha256sums=('SKIP')

_pkgname=pymavlink

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
