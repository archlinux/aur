# SPDX-License-Identifier: AGPL-3.0
#
# Contributor: Oskar Roesler <oskar at oskar-roesler dot de>
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Danilo Bellini (hexd) <danilo.bellini@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_py="python2"
_pkg="ply"
pkgname="${_py}-${_pkg}"
pkgver=3.11
pkgrel=8
_pkgdesc=(
  'Implementation of lex and '
  'yacc parsing tools')
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
url="https://www.dabeaz.com/${_pkg}"
license=(
  'BSD'
)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi="https://pypi.io/packages/source"
source=(
  "${_pypi}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(
  '37e39a4f930874933223be58a3da7f259e155b75135f1edd47069b3b40e5e96af883ebf1c8a1bbd32f914a9e92cfc12e29fec05cf61b518f46c1d37421b20008'
)

check() {
  cd \
    "${_pkg}-${pkgver}/test"
  "${_py}" \
    testlex.py
  "${_py}" \
    testyacc.py
}

package() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
