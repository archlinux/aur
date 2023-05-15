# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pydsdl
pkgver=1.20.0
pkgrel=1
pkgdesc='UAVCAN DSDL processing front end implemented in Python'
arch=('x86_64')
url='https://uavcan.org'
license=('MIT')
depends=('python' 'python-parsimonious' 'python-six')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/UAVCAN/pydsdl/archive/$pkgver.tar.gz")
sha256sums=('61e4512660d081b08fe7c49cca69340a44ae72d2f3fa3f43dbbcff3c18cc0df2')

_pkgname=pydsdl

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
