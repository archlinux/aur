pkgname=python-tree-sitter
pkgver=0.20.2
pkgrel=1
pkgdesc='Python bindings to the tree-sitter parsing library'
arch=('any')
url='https://github.com/tree-sitter/py-tree-sitter'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
)
source=("https://pypi.io/packages/source/t/tree_sitter/tree_sitter-$pkgver.tar.gz")
sha256sums=('0a6c06abaa55de174241a476b536173bba28241d2ea85d198d33aa8bf009f028')

build() {
  cd "$srcdir/tree_sitter-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/tree_sitter-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
}
