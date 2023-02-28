# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-dm-tree
pkgver=0.1.8
pkgrel=1
pkgdesc='tree is a library for working with nested data structures'
arch=('any')
url='https://tree.readthedocs.io'
license=('Apache-2.0')
depends=(python python-six)
makedepends=(python python-build python-installer python-wheel python-setuptools
             cmake git)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/d/dm-tree/dm-tree-${pkgver}.tar.gz")
sha256sums=('0fcaabbb14e7980377439e7140bd05552739ca5e515ecb3119f234acee4b9430')

_pkgname=dm-tree

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
