pkgname=python-subprocess_shell
pkgver=1.0.0
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess-shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  'f323abdeb76c1a43867f383cfcf4ffb57f953a4d574434980fe30414fa54bac5'
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
