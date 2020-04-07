# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-dm-tree
pkgver=0.1.4
pkgrel=1
pkgdesc='tree is a library for working with nested data structures'
arch=('any')
url='https://tree.readthedocs.io'
license=('Apache-2.0')
depends=(python python-six)
optdepends=()
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/d/dm-tree/dm-tree-${pkgver}.tar.gz")
sha256sums=('c4477ba8fee2fd7113ce0ef48a5bcf4f881100dcf5e609853368bbab96f4095e')

_pkgname=dm-tree

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
