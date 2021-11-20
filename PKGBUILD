# Maintainer: robertfoster
_name=mediapipe
_py=cp39
pkgname=python-mediapipe
pkgver=0.8.9
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/bf/b5/4803a31aef0c5b63aa177e2a3a4a20642736fbf876e93e2be74f5ab3c03b/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  cd "${srcdir}"
  PIP_CONFIG_FILE=/dev/null \
    pip install --root="${pkgdir}" \
    --isolated \
    --ignore-installed \
    --no-deps \
    ${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
}

sha256sums=('899f686f323ceeeb4a5ea359b08f572342b9fc5672b0fb2cdad1cee03b1d8609')
