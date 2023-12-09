pkgname=python-subprocess_shell
pkgver=0.0.7
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess-shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  '415aac51f1c204102e5f868e1793f00fc06ce85fc6daa1dcac0b113ea93bb975'
)
depends=('python')
makedepends=('python-build' 'python-installer')

build() {
  cd "$srcdir/subprocess_shell-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/subprocess_shell-$pkgver"
  python -m installer "--destdir=$pkgdir" ./dist/*.whl
}
