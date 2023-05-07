# Maintainer: robertfoster
_name=mediapipe
_py=cp311
pkgname=python-mediapipe
pkgver=0.9.3.0
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('absl-py' 'python' 'python-cycler' 'python-dateutil' 'python-fonttools' 'python-kiwisolver'
  'python-matplotlib' 'python-opencv' 'python-pillow' 'python-protobuf' 'python-wheel')
makedepends=('python-pip')

source=("https://files.pythonhosted.org/packages/2e/97/afe0b0637d182d086d059831a17221e655e6336b2e797b8329fad7c77b61/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

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

sha256sums=('d9615104b78f0bc7a71087ee74a98330b536c093c1baee797c5146b543e7403f')
