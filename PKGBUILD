# Maintainer: Dani <kpssakk@gmail.com>
pkgname=python-cmd-game-chess
_name=cmd-game-chess
pkgver=0.1.5
pkgrel=1
pkgdesc="A simple command-line chess game with AI"
arch=('any')
url="https://github.com/Danil-gtj/cmd-chess.git"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# Указываем загрузку прямо из PyPI
source=("https://files.pythonhosted.org/packages/source/c/cmd-game-chess/cmd_game_chess-$pkgver.tar.gz")
sha256sums=('4f4b7610bede21eb5f96704d45730d35b6fad88bc5d90b902e4451d5efb39434')

build() {
  cd "cmd_game_chess-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "cmd_game_chess-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
