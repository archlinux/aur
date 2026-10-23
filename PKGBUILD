# Maintainer: Avery Visentin <averyvisentin@gmail.com>

pypiname=terminal_tetris
pkgname=terminal-tetris
pkgver=0.0.13
pkgrel=1
pkgdesc="A simple Tetris game for the terminal."
arch=('any')
url="https://github.com/averyvisentin/terminal-tetris"
license=('MIT')

depends=('python-blessed')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/02/54/3d5a4dcea55d4afd2cdd6bea885c1434a5c9d77c50fc5e7d4c5a9f4efe1d/terminal_tetris-0.0.13.tar.gz")
sha256sums=('047f6ca94820bc23c46952929b7f5abc8fe33783ee783cd45cd053e2a0527e4d')

build() {
  cd "$pypiname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pypiname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
