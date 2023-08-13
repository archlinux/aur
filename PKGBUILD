# Maintainer: robertfoster
_name=mediapipe
_py=cp311
pkgname=python-mediapipe
pkgver=0.10.3
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/93/0e/93270e4a7e048fcb38bb7f8690a09ec6a3f0aeeb3f8d6887d6c51497fe40/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  cd "${srcdir}"

  pip install --root="${pkgdir}" \
    --isolated \
    --ignore-installed \
    --no-deps \
    ${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl

  # Cleanup
  find "${pkgdir}" \
    -name __pycache__ \
    -exec rm -rf {} +
}

sha256sums=('dbcb2b414443d1c17e8f20f10b69d7b1113f21acff4ee1aada8e97521df71783')
