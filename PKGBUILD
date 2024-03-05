# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-yolox-git"
pkgver=0.3.0
pkgrel=3
pkgdesc='YOLOX is an object detection method, an anchor-free version of YOLO, with a simpler design but better performance.'
arch=(any)
url="https://github.com/Megvii-BaseDetection/YOLOX"
license=(MIT)
depends=(python python-numpy python-opencv python-loguru python-tqdm python-thop python-tabulate python-psutil python-pycocotools python-onnx python-pytorch)
optdepends=(python-ninja tensorboard python-onnx python-onnxsim)
conflicts=()
makedepends=(python-setuptools)
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/YOLOX"
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/YOLOX"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
