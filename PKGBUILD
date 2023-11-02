# Maintainer: gilcu3
# Previous Maintainer: Ben Alex <ben.alex@acegi.com.au>

_pkgname=tflite-runtime
pkgname=python-$_pkgname
pkgver=2.14.0
pkgrel=3
pkgdesc='TensorFlow Lite Python bindings'
arch=('any')
url='https://www.tensorflow.org/lite/'
license=('Apache')
depends=('python-tensorflow')
makedepends=("python" "python-pip")


package() {
  pip install --isolated --upgrade --no-deps --ignore-installed --root=$pkgdir --no-warn-script-location $_pkgname==$pkgver
  find $pkgdir | grep -E "(/__pycache__$|\.pyc$|\.pyo$)" | xargs rm -rf
}
