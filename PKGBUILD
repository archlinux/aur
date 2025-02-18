pkgname=python-subprocess_shell
pkgver=1.2.0
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess_shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  'd0ea661c2b9110b088172bab82d34e64d6db1287f6e484fa20cda6dbdeaeb72b'
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
