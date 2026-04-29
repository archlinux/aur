# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-pyannote.database
_pyname=pyannote_database
pkgver=6.1.1
pkgrel=1
pkgdesc='Reproducible experimental protocols for audio databases (pyannote.database)'
arch=('any')
url='https://github.com/pyannote/pyannote-database'
license=('MIT')
depends=(
    'python>=3.10'
    'python-pandas'
    'python-pyannote.core'   # AUR (ours)
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('bbe76da738257a9e64061123d9694ad7e949c4f171d91a9269606d873528cd10')

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
