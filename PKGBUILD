# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-onnx
pkgver=1.4.1
pkgrel=1
pkgdesc='Open Neural Network Exchange'
arch=('x86_64')
url=https://onnx.ai
license=('MIT')
depends=(protobuf pybind11 python-numpy python-six)
makedepends=(python-setuptools pybind11 cmake)
checkdepends=(python-nose python-pytest python-scipy)
source=("onnx-$pkgver.tar.gz"::"https://github.com/onnx/onnx/archive/v$pkgver.tar.gz")
sha512sums=('35d189b32e553bc306c453bc3d94bc8ebe2f13202c4c0a8de353e2dba60d15033629e699c5ef38f6c366df6080606b9f79a4f11ab7dcef31d865ce0df957ca92')

build() {
  cd onnx-$pkgver
  python setup.py build
}

#check() {
#  cd onnx-$pkgver
#  pytest -v
#}

package() {
  cd onnx-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
