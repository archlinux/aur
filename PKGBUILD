# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-pyannote.metrics
_pyname=pyannote_metrics
pkgver=4.1
pkgrel=1
pkgdesc='Evaluation metrics for speaker diarisation, segmentation and detection (pyannote.metrics)'
arch=('any')
url='https://github.com/pyannote/pyannote-metrics'
license=('MIT')
depends=(
    'python>=3.10'
    'python-numpy'
    'python-pandas'
    'python-pyannote.core'      # AUR (ours)
    'python-pyannote.database'  # AUR (ours)
    'python-scikit-learn'
    'python-scipy'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('afe24c54ee0799e8cfbe8ee85fa517793c3450bb7eae8fedd1a77ccec0343f7e')

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
