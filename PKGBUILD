# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=dynssh
_pkgver=0.1.1
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
  "692f09941d432c35f0a99365178f7b06b6c5d3a29a9e2de52e15564fb9c49625"
  # "SKIP"
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
