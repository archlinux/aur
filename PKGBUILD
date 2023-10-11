# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-yolox"
pkgver=0.3.0
pkgrel=1
pkgdesc='YOLOX is an object detection method, an anchor-free version of YOLO, with a simpler design but better performance.'
arch=(any)
url="https://github.com/Megvii-BaseDetection/YOLOX"
license=(MIT)
depends=(python python-numpy python-opencv python-loguru python-tqdm python-thop python-tabulate python-psutil python-pycocotools python-onnx python-pytorch)
optdepends=(python-ninja tensorboard python-onnx python-onnxsim)
conflicts=()
makedepends=(python-setuptools)
source=(YOLOX-$pkgver.tar.gz::"$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('972ddb9cb13d508fac3738e814449327cec29bc55fbd8a125c67d9080edfc02d')

build() {
  cd "${srcdir}/YOLOX-$pkgver"
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/YOLOX-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
