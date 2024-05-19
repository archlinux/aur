pkgname=python-subprocess_shell
pkgver=1.0.2
pkgrel=1
pkgdesc='A shell for subprocess'
arch=('any')
url='https://gitlab.com/notEvil/subprocess_shell'
license=('MIT')
source=(
  "https://pypi.io/packages/source/s/subprocess-shell/subprocess_shell-$pkgver.tar.gz"
)
sha256sums=(
  '890bf9b537cfb3d510b7414062f8f6eaea3a0a0233fb743a6198bb335646061f'
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
