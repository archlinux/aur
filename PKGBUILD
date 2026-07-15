# Maintainer: Patrick Mischke
pkgname=hexxengenerator
pkgver=0.14.0
pkgrel=1
pkgdesc="Charakter Generator für Hexxen 1733"
arch=('any')
url="https://gitlab.com/Patschke/Hexxen-Generator"
license=('EUPL-1.2')
depends=(
    'python>=3.12.5'
    'python-numpy'
    'python-pyqt6'
    'python-pymupdf'
    'python-beautifulsoup4'
    'python-lxml'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-setuptools'
    'python-wheel'
    'python-setuptools-git-versioning'
)
source=("git+https://gitlab.com/Patschke/Hexxen-Generator.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/Hexxen-Generator"
    python -m build --wheel
}

package() {
    cd "${srcdir}/Hexxen-Generator"
    python -m pip install --root="${pkgdir}" --no-deps dist/*.whl
}
