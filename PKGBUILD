# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0

_pkgname=gpic
pkgname="${_pkgname}-git"
pkgver=v1.0+1+g18ea110
pkgrel=1
pkgdesc="Downloads a google account's picture."
arch=(any)
_repo="https://github.com"
_ns="themartiancompany"
url="${_repo}/${_ns}/${_pkgname}"
license=(
  AGPL3)
depends=(
  curl)
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
# vim:set sw=2 sts=-1 et:
