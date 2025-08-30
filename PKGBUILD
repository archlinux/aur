# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-doctr"
_name="python_doctr"
pkgver=1.0.0
pkgrel=1
pkgdesc="Document Text Recognition (docTR): deep Learning for high-performance OCR on documents."
arch=('any')
url="https://pypi.org/project/python-doctr/"
license=('Apache-2.0')
provides=()
depends=(
  python
  python-opencv
  python-numpy
  python-scipy
  python-h5py
  python-opencv
  python-pyclipper
  python-shapely
  python-langdetect
  python-rapidfuzz
  python-huggingface-hub
  python-pillow
  python-defusedxml
  python-tqdm
  # AUR
  python-pypdfium2
  python-anyascii
)
optdepends=(
  python-tensorflow
  python-tensorflow-cuda
  python-pytorch
  python-torchvision
  python-onnx
  python-weasyprint
  python-matplotlib
  # AUR
  python-tf-keras
  python-tf2onnx
  python-mplcursors
)
makedepends=(python-build python-installer python-wheel)
checkdepends=()
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('1d307fee13a7ea82fcbfcf66a56c2223a38c59575ea67703a39763cf09f106a9')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$_name-$pkgver"
  python -m installer --prefix="/usr" --destdir="${pkgdir}" dist/*.whl
}
