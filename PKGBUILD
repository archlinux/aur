# Maintainer: robertfoster
_name=mediapipe
_py=cp311
pkgname=python-mediapipe
pkgver=0.10.0
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/45/63/f1a7b05021f3055ecf72eee427e002704fa097a3afddbce791bee2470c84/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

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

sha256sums=('ef4f058779240c7bda3aa09501dec6fe8713edc48460fd3b256d06f82c48ffb0')
