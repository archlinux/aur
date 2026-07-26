# Maintainer: nikitastrelom <l35gamershaman@gmail.com>
pkgname=termsweeper
pkgver=1.0.8
pkgrel=1
pkgdesc="Just a game-minesweeper on the Linux terminal."
arch=('any')
url="https://github.com/nikitastrelom/termsweeper"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir"
    cd $(find . -maxdepth 1 -type d ! -name "." ! -name ".." | head -n 1)
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"
    cd $(find . -maxdepth 1 -type d ! -name "." ! -name ".." | head -n 1)
    python -m installer --destdir="$pkgdir" dist/*.whl
}
