# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=sus
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple setup user script"
arch=(
  any
)
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
  # "${pkgname}-${pkgver}::git+file://${_url}#tag=v${pkgver}"
)
sha256sums=(
  "6ffac202a76a44e20467c1752a890e93b74f1cde4b386bec808cac74756e2526"
  # SKIP
)

package() {
  cd \
    "${pkgname}-${pkgver}"
  make \
    PREFIX="/usr" \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
