# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=numix-cursor-theme
pkgname=${_pkgname}-git
pkgver=r37.d237ecd
pkgrel=1
pkgdesc="Numix cursor theme for Linux"
arch=('any')
url="https://numixproject.github.io"
license=('GPL3')
makedepends=('git' 'inkscape' 'xorg-xcursorgen')
source=("${_pkgname}"::"git+https://github.com/numixproject/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  ./build.sh
}

package() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/usr/share/icons"
  cp -dr --no-preserve='ownership' Numix-Cursor{,-Light} "${pkgdir}/usr/share/icons"
}
