# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-dm-tree
pkgver=0.1.1
pkgrel=1
pkgdesc='tree is a library for working with nested data structures'
arch=('any')
url='https://tree.readthedocs.io'
license=('Apache-2.0')
depends=(python python-six)
optdepends=()
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://github.com/deepmind/tree/archive/$pkgver.tar.gz")
sha256sums=('f326e1c450a7d3cfd42288c2a1a0ef1cfb2bfa576f7f936d50a1fa144942e0a1')

_pkgname=tree

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
