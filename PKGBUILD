# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-onnxsim"
pkgver=0.4.33
pkgrel=1
pkgdesc='ONNX Simplifier is presented to simplify the ONNX model.'
arch=(any)
url="https://github.com/daquexian/onnx-simplifier"
license=(MIT)
depends=(python python-onnx python-onnxoptimizer python-onnxruntime python-protobuf pyton-rich)
conflicts=()
makedepends=(python-setuptools)
source=(onnx-simplifier-$pkgver.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a87d104505f941ccb96a91ac31f451ee25f00996934f330a39c4cce3f5498131')

build() {
  cd "${srcdir}/onnx-simplifier-$pkgver"
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/onnx-simplifier-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
