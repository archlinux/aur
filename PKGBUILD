# SPDX-License-Identifier: AGPL-3.0
# 
# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Infernio <infernio at icloud dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_py="python2"
_pkg="pkgconfig"
pkgname="${_py}-${_pkg}"
pkgver=1.5.2
pkgrel=1
_pkgdesc=(
  "Python 2 module to interface with"
  "the pkg-config command line tool"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  any
)
_ns="matze"
url="https://github.com/${_ns}/${_pkg}"
license=(
  MIT
)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi_url="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  '38d612488f0633755a2e7a8acab6c01d20d63dbc31af75e2a9ac98a6f638ca94'
)

package() {
  cd \
    "${_pkg}-${pkgver}"

  "${_py}" \
    setup.py \
      install \
        --prefix=/usr \
        --root="${pkgdir}" \
        --optimize=1
  install \
    -Dm644 \
    LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
