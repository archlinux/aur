pkgname=python-tree-sitter
pkgver=0.20.1
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
source=("https://files.pythonhosted.org/packages/ea/11/8d3f8ed4761c375dca0918a5b170aa2d777f5325c5442c36c0851305b77a/tree_sitter-$pkgver.tar.gz")
sha256sums=('e93f082c545d6649bcfb5d681ed255eb004a6ce22988971a128f40692feec60d')

build() {
  cd "$srcdir/tree_sitter-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/tree_sitter-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
}
