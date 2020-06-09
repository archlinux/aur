# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-dm-tree-git
pkgver=r49.63e7c35
pkgrel=1
pkgdesc='tree is a library for working with nested data structures'
arch=('any')
url='https://tree.readthedocs.io'
license=('Apache-2.0')
depends=(python python-six)
optdepends=()
makedepends=(python python-setuptools bazel)
provides=('python-dm-tree')
conflicts=('python-dm-tree')
source=("$pkgname::git+https://github.com/deepmind/tree")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
