# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=numix-cursor-theme
pkgname=${_pkgname}-git
pkgver=r32.e92186d
pkgrel=1
pkgdesc="Numix cursor theme for Linux"
arch=('any')
url="http://numixproject.org/"
license=('GPLv3')
makedepends=('git')
source=("${_pkgname}"::"git+https://github.com/numixproject/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/usr/share/icons"
  cp -dr --no-preserve='ownership' Numix{,-Light} "${pkgdir}/usr/share/icons"
}
