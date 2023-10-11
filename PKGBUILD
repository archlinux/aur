# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-yolox"
pkgver=0.3.0
pkgrel=2
pkgdesc='YOLOX is an object detection method, an anchor-free version of YOLO, with a simpler design but better performance.'
arch=(any)
url="https://github.com/Megvii-BaseDetection/YOLOX"
license=(MIT)
depends=(python python-numpy python-opencv python-loguru python-tqdm python-thop python-tabulate python-psutil python-pycocotools python-onnx python-pytorch)
optdepends=(python-ninja tensorboard python-onnx python-onnxsim)
conflicts=()
makedepends=(python-setuptools)
source=(YOLOX-main.zip::"$url/archive/refs/heads/main.zip")
sha256sums=('c3575f0c242b104a650931ff91d893e9835983aa549ae51cd338280ff701a1b4')

build() {
  cd "${srcdir}/YOLOX-main"
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/YOLOX-main"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
