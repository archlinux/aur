# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0

_pkgname=reallymakepkg
pkgname="${_pkgname}-git"
pkgver=v1.0+14+gadf3d03
pkgrel=1
pkgdesc="System-independent makepkg"
arch=(any)
_repo="https://github.com"
_ns="themartiancompany"
url="${_repo}/${_ns}/${_pkgname}"
license=(
  AGPL3)
depends=()
makedepends=(
  git)
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
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
