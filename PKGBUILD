# Maintainer: robertfoster
_name=mediapipe
_py=cp310
pkgname=python-mediapipe
pkgver=0.9.1.0
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/2e/3e/b3c80553caa138689cb113778950be75ef54adee6213680807ead5c14ab7/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  cd "${srcdir}"
  PIP_CONFIG_FILE=/dev/null \
    pip install --root="${pkgdir}" \
    --isolated \
    --ignore-installed \
    --no-deps \
    ${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
}

sha256sums=('202dab5de7ca6adddcd40bae9020c26a39fdb5b9b4bf5df61ee8ee327405ef80')
