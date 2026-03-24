# Maintainer: Florian Maas <fpgmaas@gmail.com>
pkgname=python-justx
pkgver=0.5.3
pkgrel=1
pkgdesc="A TUI command launcher built on top of just. Define recipes once, run them anywhere."
arch=('any')
url="https://github.com/fpgmaas/justx"
license=('MIT')
depends=(
    'python'
    'python-click'
    'python-pydantic'
    'python-questionary'
    'python-rich'
    'python-textual'
)
makedepends=(
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/j/justx/justx-${pkgver}.tar.gz")
sha256sums=('eb7ae9d29b7b5e35deee54a7362618a88acd0d9ec653fdc4531da0ecabe3289d')

build() {
    cd "justx-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "justx-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
