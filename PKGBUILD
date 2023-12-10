# SPDX-License-Identifier: AGPL-3.0
# Maintainer: Truocolo <truocolo@aol.com>

pkgname=mediascan
pkgver=1
pkgrel=2
_pkgdesc=(
  "Scan a directory for media files"
  "using Android media library.")
arch=(
  any)
url="https://aur.archlinux.org/packages/${pkgname}"
license=(
  AGPL3)
depends=()
makedepends=()
checkdepends=(
  shellcheck)
source=(
  mediascan
  Makefile
  LICENSE)
sha256sums=(
  1f404a86aa9bafc5570557e631d5a629bd9cdbac89540a55221874041f25b6a9
  77eb4eb49bc286f772ce32721713e86836afa66547931a6e104414d100957f6e
  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)

build() {
  echo 'no build'
}

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
