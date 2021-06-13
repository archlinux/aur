# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-dm-tree
pkgver=0.1.6
pkgrel=1
pkgdesc='tree is a library for working with nested data structures'
arch=('any')
url='https://tree.readthedocs.io'
license=('Apache-2.0')
depends=(python python-six)
optdepends=()
makedepends=(python python-setuptools bazel)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/d/dm-tree/dm-tree-${pkgver}.tar.gz")
sha256sums=('6776404b23b4522c01012ffb314632aba092c9541577004ab153321e87da439a')

_pkgname=dm-tree

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
