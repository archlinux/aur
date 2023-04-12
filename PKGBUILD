# Maintainer: robertfoster
_name=mediapipe
_py=cp310
pkgname=python-mediapipe
pkgver=0.9.2.1
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/0a/63/5300164289477fbd1d6f00df36d2732b000b950e9d80cda6c67d6a986361/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

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

sha256sums=('f0b4a04dc70d0370fef6c05d3861d5830fdc85d2c0c065b17613702e0891bdd1')
