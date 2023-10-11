# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-onnxsim"
pkgver=0.4.33
pkgrel=4
pkgdesc='ONNX Simplifier is presented to simplify the ONNX model.'
arch=(any)
url="https://github.com/daquexian/onnx-simplifier"
license=(MIT)
depends=(python python-onnx python-onnxoptimizer python-onnxruntime python-protobuf python-rich)
conflicts=()
makedepends=(python-setuptools)
source=(onnx-simplifier-master.zip::"$url/archive/refs/heads/master.zip")
sha256sums=('8fa93121d62fb42956ea6e69cbb2bab1609a319ad9404e1004473c1ae3299ea0')

build() {
  cd "${srcdir}/onnx-simplifier-master"
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/onnx-simplifier-master"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
