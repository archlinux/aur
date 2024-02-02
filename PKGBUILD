# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Marc Etzhold (majorx234) <majorx234@googlemail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_variant="persistent"
pkgname="${_pkg}-profiles"
pkgver=0.1
pkgrel=1
pkgdesc='Extra profiles for Archiso'
arch=(
  'any'
)
license=(
  'GPL3'
)
_http="https://gitlab.archlinux.org"
_ns="tallero"
url="${_http}/${_ns}/${pkgname}"
depends=(
  "${_pkg}-${_variant}-git"
)
makedepends=(
  'git'
)
checkdepends=(
  'shellcheck'
)
optdepends=()
_commit="a53522b593b5675c24fc1e7132bb631f21a90291"
source=(
  "git+${url}#commit=${_commit}"
)
sha256sums=(
  'SKIP'
)

# shellcheck disable=SC2154
package() {
  local \
    _dest \
    _profiles=() \
    _profile
  _profiles+=(
    $(ls \
        "${srcdir}/${_pkgname}")
  )
  _dest="${pkgdir}/usr/share/${_pkg}/configs"
  install \
    -dm755 \
    "${_dest}"
  for _profile \
    in "${_profiles[@]}"; do
    cp \
      -r \
      "${srcdir}/${pkg}" \
      "${_dest}"
  done
}

# vim:set sw=2 sts=-1 et:
