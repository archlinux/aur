# Maintainer: Truocolo <truocolo@aol.com>

pkgname=aspe
pkgver=1
pkgrel=2
pkgdesc="Arch Linux build source file clone tool"
arch=(any)
url="https://aur.archlinux.org/packages/${pkgname}"
license=(
  AGPL3)
depends=()
makedepends=()
checkdepends=(
  shellcheck)
source=(
  aspe
  Makefile
  LICENSE)
md5sums=(
  64c1f7a1d95f5b55ea8657fcda94992778f3e87f2a7ffb711cfe7670305db0a2
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
