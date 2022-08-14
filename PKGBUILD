# Maintainer: Henry Jia <henryjia18@gmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-onnx-tensorflow
pkgver=1.10.0
pkgrel=1
pkgdesc='Open Neural Network Exchange Tensorflow Backend'
arch=('x86_64')
url='https://onnx.ai'
license=('MIT')
depends=(
  'python-onnx'
  'python-yaml'
  'python-yaml'
  'python-setuptools'
)
makedepends=(
  'git'
  'python-onnx'
  'python-yaml'
  'python-setuptools'
)

optdepends=(
  'mxnet'
  'python-pytorch'
  'python-tensorflow'
)
source=("${pkgname}::git+https://github.com/onnx/onnx-tensorflow.git#tag=v${pkgver}")
sha512sums=('SKIP')

get_pyver() {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

}
# vim:set ts=2 sw=2 et:
