# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pydsdl
pkgver=1.16.1
pkgrel=1
pkgdesc='UAVCAN DSDL processing front end implemented in Python'
arch=('x86_64')
url='https://uavcan.org'
license=('MIT')
depends=('python' 'python-parsimonious' 'python-six')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/UAVCAN/pydsdl/archive/$pkgver.tar.gz")
sha256sums=('74ccd65055e60868d4f005301323051c21c8e271c262e26b416db731321e8506')

_pkgname=pydsdl

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
