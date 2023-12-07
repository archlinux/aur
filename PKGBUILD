# Maintainer: Truocolo <truocolo@aol.com>

pkgname=aspe
pkgver=1
pkgrel=1
pkgdesc="Arch Linux build source file clone tool"
arch=(any)
url="https://aur.archlinux.org/packages/${pkgname}"
license=(
  AGPL3)
depends=()
makedepends=()
source=(
  aspe
  Makefile
  LICENSE)
md5sums=(
  8f13fd612f312bc9ae4ce706555a2232c3204a0dcedfad431a558ea19055f9bd
  f4b3a84d382cf5e2854aceed47ceac8dd8f8cea8f6b5628fb96a1843aeccd3f3
  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)

build() {
  echo 'no build'
}

package() {
  local \
    _pkgdir="${pkgdir}"
  [ ! -n "${terdir}" ] && \
    echo "${terdir}"
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
