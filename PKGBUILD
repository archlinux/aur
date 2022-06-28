# Maintainer: robertfoster
_name=mediapipe
_py=cp310
pkgname=python-mediapipe
pkgver=0.8.10.1
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/a2/ee/5f6071731226eed3902e8773121cb483c66f44c4114d76f2a09042dca34b/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  cd "${srcdir}"
  PIP_CONFIG_FILE=/dev/null \
    pip install --root="${pkgdir}" \
    --isolated \
    --ignore-installed \
    --no-deps \
    ${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
}

sha256sums=('696bcdcfdcb16b9f4c36227fc5187ddf4128f193bc3acd8e449ff89e954086ec')
