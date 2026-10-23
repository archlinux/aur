# Maintainer: Avery Visentin <averyvisentin@gmail.com>

pypiname=terminal_tetris
pkgname=terminal-tetris
pkgver=0.0.12
pkgrel=5
pkgdesc="A simple Tetris game for the terminal."
arch=('any')
url="https://github.com/averyvisentin/terminal-tetris"
license=('MIT')

depends=('python-blessed')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/db/5f/273a53d496f046c4b7c4e0d4a58d21b4e283302bd9b8a0962b648f7b43a2/terminal_tetris-0.0.12.tar.gz")
sha256sums=('ee966e2061fab88c42b8a7ecacee64e6ad1d402385debc55b151b9c18560e014')

build() {
  cd "$pypiname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pypiname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
