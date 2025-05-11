pkgname=python-subprocess_shell
pkgver=1.2.1
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess_shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  '79d19c6d36974540a94635aad51fafff6a179e7fcb44ee8c96d02ce0eec5155d'
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
