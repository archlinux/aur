# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=sus
_pkgver=0.1
pkgver="v${_pkgver}"
pkgrel=1
pkgdesc="Simple setup user script"
arch=(any)
_host='https://github.com'
_ns='themartiancompany'
url="${_host}/${_ns}/${pkgname}"
license=(
  AGPL3
)
depends=()
makedepends=(
  # git
)
checkdepends=(
  shellcheck
)
_url="file://${HOME}/${pkgname}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "git+file://${_url}"
)
sha256sums=(
  "1c810836bd7a71d1650c207a5d3596b27d83e627c3376e738152ac93a939e9b2"
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
