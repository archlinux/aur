pkgname=python-subprocess_shell
pkgver=1.1.1
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess-shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  '9de7b0211f385fbcce7c9d33c96272911e639e2ef6d69df534af01b717a3c9b8'
)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')

build() {
  cd "$srcdir/subprocess_shell-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/subprocess_shell-$pkgver"
  python -m installer "--destdir=$pkgdir" ./dist/*.whl
}
