pkgname=python-subprocess_shell
pkgver=0.0.2
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess-shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  '2b13bcf26001c2ec375ca6974f6c15692087cb1aa69cbefb9603523ede3b67b9'
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
