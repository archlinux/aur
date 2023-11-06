pkgname=python-subprocess_shell
pkgver=0.0.6
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess-shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  '802adbed3282a210151f84e56bb7ff70419b7b6dc1e4990cc0f1f52fbbe10ce7'
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
