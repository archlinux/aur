# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=dynssh
_pkgver=0.1.2
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
  '5fb4f730856c0a8f1afe94106960a5ee8f3d7d39073a3e823b835d5207d37d5f'
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
