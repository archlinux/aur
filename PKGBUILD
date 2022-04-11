# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-dm-tree
pkgver=0.1.7
pkgrel=1
pkgdesc='tree is a library for working with nested data structures'
arch=('any')
url='https://tree.readthedocs.io'
license=('Apache-2.0')
depends=(python python-six)
optdepends=()
makedepends=(python python-setuptools cmake git)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/d/dm-tree/dm-tree-${pkgver}.tar.gz")
sha256sums=('30fec8aca5b92823c0e796a2f33b875b4dccd470b57e91e6c542405c5f77fd2a')

_pkgname=dm-tree

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
