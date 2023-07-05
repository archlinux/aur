# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_py="python2"
_pkg="pox"
pkgname="${_py}-${_pkg}"
pkgver=0.2.9
pkgrel=1
pkgdesc="Utilities for filesystem exploration and automated builds"
_ns="uqfoundation"
url="https://github.com/${_ns}/${_pkg}"
arch=(any)
license=('BSD')
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi_url="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.zip"
)
sha256sums=(
  'f08b5453edf94fd6fdb28e043658cdd6151d5fd8384066a24fad8d4bd7e637c0'
)

build() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" setup.py build
}

package() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" setup.py install --root="${pkgdir}" \
                            --optimize=1
}

# vim:set sw=2 sts=-1 et:
