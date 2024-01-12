# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=sus
pkgname="${_pkgname}-git"
pkgver="v0.1+3+g0d3bd1f"
pkgrel=2
pkgdesc="Simple setup user script"
arch=(any)
_host='https://github.com'
_ns='themartiancompany'
url="${_host}/${_ns}/${_pkgname}"
license=(
  AGPL3
)
depends=()
makedepends=()
checkdepends=(
  shellcheck
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_url="file://${HOME}/${_pkgname}"
source=(
  "git+${_url}"
)
sha256sums=(
  SKIP
)

pkgver() {
  cd \
    "${_pkgname}"
  git \
    describe \
    --tags | \
    sed \
      's/-/+/g'
}

package() {
  cd \
    "${_pkgname}"
  make \
    PREFIX="/usr" \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
