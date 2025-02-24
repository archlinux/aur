# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-cpufeature
_pkgname=cpufeature
pkgver=0.2.1
pkgrel=1
pkgdesc='Python module for detection of CPU feature'
arch=('x86_64')
url='https://github.com/robbmcleod/cpufeature'
license=('CC0-1.0')
depends=(
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/robbmcleod/cpufeature/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7607669d37ceda17b81568a3367b419275d5d4f54b62f1a8e199b50e05bcd033b518200755469da56398b66780b064f2a872cc42cbf9aeb618c7caf3cfb1462c')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
