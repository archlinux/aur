# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_proj="hip"
pkgname=dynssh
_pkgver=0.1.2.1
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Small SSH wrapper"
arch=(any)
_host='https://github.com'
_ns='themartiancompany'
url="${_host}/${_ns}/${pkgname}"
license=(
  AGPL3)
depends=(
  openssh
  net-tools
)
makedepends=(
)
groups=(
  "${_proj}"
)
checkdepends=(
  shellcheck
)
_url="file://${HOME}/${pkgname}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  # "${_local}#tag="${pkgver}"
)
sha256sums=(
  "361cb9cea01287ac9ab16da17d13b86692dc67800754c5550e0b188e56fd0c78"
  # "SKIP"
)

package() {
  cd \
    "${pkgname}-${_pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
