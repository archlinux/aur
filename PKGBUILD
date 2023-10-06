# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-multiscaledeformableattention"
pkgver=1.0.0
pkgrel=1
pkgdesc='Python library of MultiScaleDeformableAttention, the CUDA operator proposed by Deformable DETR.'
arch=(any)
url="https://github.com/fundamentalvision/Deformable-DETR"
license=(MIT)
depends=(python cuda gcc python-pytorch)
conflicts=()
makedepends=(python-setuptools)
source=(Deformable-DETR.zip::"$url/archive/refs/heads/main.zip")
sha256sums=('cad9494f22e6293c33bb210a81ac4d4b7eee92bbaaf696ead965322b9b90739b')

build() {
  cd "${srcdir}/Deformable-DETR-main"
  cd ./models/ops
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/Deformable-DETR-main"
  #python -m installer --destdir="$pkgdir" dist/*.whl  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  cd ./models/ops
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
