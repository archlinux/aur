# Maintainer: Dani <kpssakk@gmail.com>
pkgname=python-cmd-game-chess
_name=cmd-game-chess
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple command-line chess game with AI"
arch=('any')
url="https://github.com/Danil-gtj/cmd-chess.git"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# Указываем загрузку прямо из PyPI
source=("https://files.pythonhosted.org/packages/source/c/cmd-game-chess/cmd-game-chess-$pkgver.tar.gz")
sha256sums=('SKIP') # Для первой версии можно SKIP, потом лучше генерировать

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
