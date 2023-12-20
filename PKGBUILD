# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0

_pkgname=reallymakepkg
pkgname="${_pkgname}-git"
pkgver=1
pkgrel=2
pkgdesc="System-independent makepkg"
arch=(any)
_repo="https://gitlab.com"
_ns="theamericancompany"
url="${_repo}/${_ns}/${pkgname}"
license=(
  AGPL3)
depends=()
makedepends=(
  git)
provides=(
  "${_pkgname}=${pkgver}")
conflicts=(
  "${_pkgname}=${pkgver}")
_url="file://${HOME}/${_pkgname}"
source=(
  "git+${url}")
sha256sums=(
  SKIP)

package() {
  cd \
    "${_pkgname}"
  make \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
