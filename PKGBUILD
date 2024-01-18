# Maintainer: gilcu3
_pkgname=onnxruntime
pkgname=python-$_pkgname-bin
pkgver=1.16.3
pkgrel=1
pkgdesc="Cross-platform, high performance scoring engine for ML models (Python Bindings)"
arch=('x86_64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
provides=("python-onnxruntime")
conflicts=('python-onnxruntime')
depends=(python-flatbuffers python-humanfriendly python-coloredlogs)
_py=cp311
wheel_name=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_$arch.manylinux2014_$arch.whl
source=(https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$wheel_name)
sha256sums=('3e253e572021563226a86f1c024f8f70cdae28f2fb1cc8c3a9221e8b1ce37db5')

package() {
  python -m installer --destdir="$pkgdir" $wheel_name
}
