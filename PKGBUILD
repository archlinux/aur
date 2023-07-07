# Maintainer: robertfoster
_name=mediapipe
_py=cp311
pkgname=python-mediapipe
pkgver=0.10.1
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/4b/58/302abf82566ed72d245ac33d9aede737f294de76eed6c677311259768a10/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  cd "${srcdir}"
  #PIP_CONFIG_FILE=/dev/null \
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

sha256sums=('99fdb63ebc2b615bf7b8a9bbf46547b1a6b2fdf495e7a350f30d9a85b5ab61a8')
