# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-qtm
pkgver=2.1.0
pkgrel=1
pkgdesc='Python implementation of the real-time protocol for Qualisys Track
Manager'
arch=('any')
url='https://qualisys.github.io/qualisys_python_sdk/index.html'
license=('MIT')
depends=(python)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/q/qtm/qtm-${pkgver}.tar.gz")
sha256sums=('40d897aa3d3bd46c7a339c89468c9fafe5fe491a30123fa8b129a2161aa1cbf8')

_pkgname=qtm

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
