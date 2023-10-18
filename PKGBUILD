pkgname=python-subprocess_shell
pkgver=0.0.3
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess-shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  '64d2d9be30acd1b5c47259e8c2c26824867ccad666d3f35371f1e0595ec6290f'
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
