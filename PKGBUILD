# Maintainer: robertfoster
_name=mediapipe
_py=cp310
pkgname=python-mediapipe
pkgver=0.8.9.1
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/49/60/a1619ba4edd89fa78a687c0fb94476bb55a2e37e8d380bbd756b8a7934fd/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  cd "${srcdir}"
  PIP_CONFIG_FILE=/dev/null \
    pip install --root="${pkgdir}" \
    --isolated \
    --ignore-installed \
    --no-deps \
    ${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
}

sha256sums=('2cb270484071c7a8469b8107727a42696932fa9d8b8e9dcfe04ab8268bdc4bef')
