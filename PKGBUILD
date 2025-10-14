# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=PhiK
pkgname=python-phik
pkgver=0.12.5
pkgrel=1
pkgdesc='Phi_K correlation analyzer library'
arch=('x86_64')
url='https://github.com/kaveio/phik'
license=('Apache-2.0')
depends=(
  gcc-libs
  glibc
  python-joblib
  python-matplotlib
  python-numpy
  python-pandas
  python-scipy
)
makedepends=(
  cmake
  pybind11
  python-build
  python-installer
  python-scikit-build-core
  python-wheel
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/KaveIO/PhiK/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fcc8819f0eaaeff937ddaeaedc156feae6789bdb88a6476350beb55ea7ae06a3f4de22ff22e51dcf19c305ad8108b48b99b16023c02babbedfaffbf467ae385a')

build() {
  cd "${_pkgname}-${pkgver}"
  CMAKE_GENERATOR="Unix Makefiles" \
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
