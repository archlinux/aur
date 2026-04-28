# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-pyannote.core
_pyname=pyannote_core
pkgver=6.0.1
pkgrel=1
pkgdesc='Advanced data structures for handling temporal segments with attached labels (pyannote.core)'
arch=('any')
url='https://github.com/pyannote/pyannote-core'
license=('MIT')
depends=(
    'python>=3.10'
    'python-numpy'
    'python-pandas'
    'python-sortedcontainers'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('4b4ada3276f6df4e073fa79166636e3597d0dcb5a0fe26014a3477867cc033fb')

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
