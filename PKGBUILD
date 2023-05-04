# Maintainer: piernov <piernov@piernov.org>

pkgname=python-segmentation-models-pytorch
pkgver=0.3.2
pkgrel=1
pkgdesc="Neural Networks for Image Segmentation based on PyTorch"
arch=('any')
url="https://github.com/qubvel/segmentation_models.pytorch"
license=('MIT')
depends=('python-pytorch' 'python-pretrainedmodels' 'python-efficientnet-pytorch' 'python-timm' 'python-tqdm' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("git+https://github.com/qubvel/segmentation_models.pytorch.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/segmentation_models.pytorch
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/segmentation_models.pytorch
  python -m installer --destdir="$pkgdir" dist/*.whl
}
