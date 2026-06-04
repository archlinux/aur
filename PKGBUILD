# Maintainer: Avery Visentin <averyvisentin@gmail.com>

_pypiname=terminal_tetris
pkgname=terminal-tetris
pkgver=0.0.10
pkgrel=2
pkgdesc="A simple Tetris game for the terminal."
arch=('any')
url="https://github.com/averyvisentin/terminal-tetris"
license=('MIT')

depends=('python-blessed')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/t/$pypiname/$pypiname-$pkgver.tar.gz")
sha256sums=('cc0fe8f333b5e5aa8d67ca6a99e9ad8c3e9db6786e4c704da12d3d9a6551c708')

build() {
  cd "$pypiname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pypiname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
