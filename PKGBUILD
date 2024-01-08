# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=dynssh
_pkgver=1.1
pkgver="v${_pkgver}"
pkgrel=1
pkgdesc="Small SSH wrapper"
arch=(any)
_host='https://github.com'
_ns='themartiancompany'
url="${_host}/${_ns}/${pkgname}"
license=(
  AGPL3)
depends=()
makedepends=(
  'reallymakepkg')
checkdepends=(
  shellcheck)
_url="file://${HOME}/${pkgname}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  # "${_local}#tag="${pkgver}"
)
sha256sums=(
  "1c810836bd7a71d1650c207a5d3596b27d83e627c3376e738152ac93a939e9b2"
  "SKIP"
)

package() {
  cd \
    "${pkgname}-${_pkgver}"
  make \
    PREFIX="/usr" \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
