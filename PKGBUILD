# Maintainer: robertfoster
_name=mediapipe
_py=cp310
pkgname=python-mediapipe
pkgver=0.8.11
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/75/b0/de86aaadb05eae01409eb1b5b8cc4b64bb0327a477b3dec8c67998755e14/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  cd "${srcdir}"
  PIP_CONFIG_FILE=/dev/null \
    pip install --root="${pkgdir}" \
    --isolated \
    --ignore-installed \
    --no-deps \
    ${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
}

sha256sums=('4a9622deabc54ebf259f5f958789c7e92a38d01938ae0dd01de017c4eb799580')
