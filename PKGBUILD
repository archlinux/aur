# Maintainer: Maik93 <michael.mugnai@gmail.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-nurbs
pkgver=5.3.1
pkgrel=2
pkgdesc="Object-oriented pure Python B-Spline and NURBS library"
arch=(x86_64)
url=https://onurraufbingol.com/NURBS-Python
_giturl=https://github.com/orbingol/NURBS-Python
license=(MIT)
depends=(python python-pytest)
optdepends=(
  'python-matplotlib>=2.2.3: required packages for visualization'
  'python-numpy>=1.15.4: required packages for visualization'
  'python-plotly: required packages for visualization'
)
makedepends=(python-setuptools cython)
checkdepends=(python-pytest python-matplotlib)
source=("${pkgname}-${pkgver}.tar.gz"::${_giturl}/archive/v${pkgver}.tar.gz)
sha256sums=('a9a7c5830294a90aa4d5249c9bb4741075816087ff2484b68ee08c93c80bda56')

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
