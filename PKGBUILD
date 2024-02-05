# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_git="false"
pkgname=reallymakepkg
_pkgver="1.1.1"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="System-independent makepkg"
arch=(any)
_repo="https://github.com"
_ns="themartiancompany"
url="${_repo}/${_ns}/${pkgname}"
license=(
  AGPL3)
depends=(
  bash
)
makedepends=()
checkdepends=(
  # shellcheck
)
source=()
sha256sums=()
_url="file://${HOME}/${_pkgname}"
[[ "${_git}" == true ]] && \
  makedepends+=(
    git
  ) && \
  source+=(
    "${pkgname}-${pkgver}::git+${url}"
  ) && \
  sha256sums+=(
    SKIP
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  ) && \
  sha256sums+=(
    'f1d9b7b702567d3aa51a5e2e6db0873763cf8723488f77e0f0cf6a2561c97df3'
  )

package() {
  cd \
    "${pkgname}-${_pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
