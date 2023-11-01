pkgname=python-subprocess_shell
pkgver=0.0.4
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess-shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  '63cd2d6c4a0d2241fabeca14f2627c1b462131172fd3ba43ba32fcd480b7754d'
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
