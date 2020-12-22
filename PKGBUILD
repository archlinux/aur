# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-nurbs
pkgver=5.2.10
pkgrel=1
pkgdesc="Object-oriented pure Python B-Spline and NURBS library"
arch=(x86_64)
url=https://onurraufbingol.com/NURBS-Python/
license=(MIT)
depends=(python python-matplotlib python-numpy)
optdepends=(python-plotly)
makedepends=(python-setuptools cython)
checkdepends=(python-pytest)
source=("${pkgname}-${pkgver}.tar.gz"::https://github.com/orbingol/NURBS-Python/archive/v${pkgver}.tar.gz)
sha256sums=('d2e5cf0b4735b1f5bb798723cffb9da11587dc2a283e2eeaccf6263d5b098637')

prepare() {
  cd NURBS-Python-${pkgver}
}

build() {
  cd NURBS-Python-${pkgver}
  python setup.py build
}

check() {
  cd NURBS-Python-${pkgver}
  python setup.py test
}

package() {
  cd NURBS-Python-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
