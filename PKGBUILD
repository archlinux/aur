# SPDX-License-Identifier: AGPL-3.0
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Fabio Castelli (muflone) <webreg@muflone.com>

pkgname=mediascan
pkgver=1
pkgrel=2
_pkgdesc=(
  "Scan a directory for media files"
  "using Android media library.")
pkgdesc="${_pkgdesc[*]}"
arch=(
  any)
url="https://aur.archlinux.org/packages/${pkgname}"
license=(
  AGPL3)
depends=()
makedepends=()
optdepends=(
  'termux-api: to run in termux')
checkdepends=(
  shellcheck)
source=(
  mediascan
  Makefile
  LICENSE)
sha256sums=(
  1f404a86aa9bafc5570557e631d5a629bd9cdbac89540a55221874041f25b6a9
  77eb4eb49bc286f772ce32721713e86836afa66547931a6e104414d100957f6e
  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0)

package() {
  local \
    _pkgdir="${pkgdir}"
  [ ! -n "${terdir}" ] && \
    _pkgdir="${terdir}"
  make \
    PREFIX="/usr" \
    DESTDIR="${_pkgdir}" \
    install
  install \
    -Dm644 \
    LICENSE \
    "${_pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
