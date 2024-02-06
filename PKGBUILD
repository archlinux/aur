# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Achilleas Pipinellis <axil@archlinux.gr>

# shellcheck disable=SC2034
_py="python2"
_pkg="progress"
pkgname="${_py}-${_pkg}"
_pkgname="${_pkg}"
pkgver=1.3
pkgrel=2
pkgdesc="Easy to use progress bars"
_http="https://github.com"
_ns="verigak"
url="${_http}/${_ns}/${_pkg}"
arch=(
  'any'
)
license=(
  'MIT'
)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-distribute"
)
provides=(
  "${_pkg}=${pkgver}")
_pypi="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  'c88d89ee3bd06716a0b8b5504d9c3bcb3c1c0ab98f96dc7f1dc5f56812a4f60a'
)

# shellcheck disable=SC2154
package() {
  cd \
    "${srcdir}/${_pkg}-${pkgver}" || \
    exit
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        -O1
  install \
    -Dm644 \
    LICENSE \
    "${pkgdir}/usr/share/licenses/${_pkg}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
