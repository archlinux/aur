# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=aspe
pkgname="${_pkgname}-git"
pkgver=v1.0+8+gcee1c15
pkgrel=2
pkgdesc="Arch Linux build source file clone tool"
arch=(any)
_host='https://github.com'
_ns='themartiancompany'
url="${_host}/${_ns}/${_pkgname}"
license=(
  AGPL3)
depends=()
makedepends=()
checkdepends=(
  shellcheck)
provides=(
  "${_pkgname}=${pkgver}")
conflicts=(
  "${_pkgname}")
_url="file://${HOME}/${_pkgname}"
source=(
  "git+${url}")
sha256sums=(
  SKIP)

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
