# Maintainer: gilcu3
# Previous Maintainer: Ben Alex <ben.alex@acegi.com.au>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

_pkgname=tflite-runtime
pkgname=python-$_pkgname
pkgver=2.20.0
_pkgsubver=$pkgver.dev20250409
pkgrel=1
pkgdesc='TensorFlow Lite Python bindings'
arch=('x86_64')
_py=cp311
url='https://www.tensorflow.org/lite/'
license=('Apache')
depends=('python-numpy')
makedepends=('python-installer')
_wheel_name=${_pkgname//-/_}_nightly-$_pkgsubver-$_py-${_py}-manylinux2014_$arch.whl
source=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname-nightly/$_wheel_name)
sha256sums=('bb54d8a5b42c1e201c232ab84c02fc2d3258db52753682a16bbc85ea453c1b26')

package() {
  python -m installer --destdir="$pkgdir" $_wheel_name
}

