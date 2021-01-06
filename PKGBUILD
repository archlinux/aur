# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=heroic-games-launcher-bin
_pkgver=0.4.1-beta
pkgver=${_pkgver%-*}
pkgrel=1
pkgdesc="HGL, a Native alternative Linux Launcher for Epic Games"
arch=('x86_64')
url="https://github.com/flavioislima/HeroicGamesLauncher"
license=('GPL3')
conflicts=(${pkgname%-*}-{appimage,electron})
depends=(xterm fuse2)
_filename=heroic-${_pkgver}.pacman
source=("$url/releases/download/${_pkgver}/${_filename}")
noextract=("${_filename}")
md5sums=('e5087ce4a32e31bb1fffbb42053df1db')
options=(!strip)

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
}

# vim:set ts=2 sw=2 et: syntax=sh
