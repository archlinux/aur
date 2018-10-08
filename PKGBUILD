# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-tensorflow-serving-api
_name=tensorflow_serving_api
pkgver=1.11.0
pkgrel=1
pkgdesc="Flexible, high-performance serving system for machine learning models, designed for production environments"
arch=(any)
url="https://www.tensorflow.org/serving/"
license=('Apache')
depends=('python' 'python-grpcio' 'python-tensorflow' 'python-protobuf')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_name-$pkgver-py2.py3-none-any.whl")
sha256sums=('eda671e9cd9d7a643a04dc1e62673a1664274a973702500696a14fe5300a4245')

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
