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
sha256sums=('38fa982ecfc8eeb7e9cbdf981a9434d09e933200967510bdc42e87d5f0fe80d4')

build() {
  cd "cmd_game_chess-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "cmd_game_chess-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
