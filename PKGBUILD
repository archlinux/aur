# Maintainer: Avery Visentin <averyvisentin@gmail.com>

pypiname=terminal_tetris
pkgname=terminal-tetris
pkgver=0.0.14
pkgrel=1
pkgdesc="A simple Tetris game for the terminal."
arch=('any')
url="https://github.com/averyvisentin/terminal-tetris"
license=('MIT')

depends=('python-blessed')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/84/df/e5a26269677eb379159dcd0f4791394e666d3595af1a59cff81959eca7b7/terminal_tetris-0.0.14.tar.gz")
sha256sums=('3a227061ad36aafff8abe0e9da962cb887431fd8d86b7c5aa32b319770b38ab6')

build() {
  cd "$pypiname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pypiname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
