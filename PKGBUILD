# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Collin 'Fwirt' Skiles <sploopby at gmail dot com>
# Maintainer: Brian "saikobee" Mock <mock.brian at gmail dot com>
# Maintainer: Carlos Solis <csolisr at gmail dot com>

set -u
pkgname='sfxr'
pkgver=1.2.1
pkgrel=4
pkgdesc='Random sound effect generator for games, etc.'
arch=('i686' 'x86_64')
url='http://www.drpetter.se/project_sfxr.html'
license=('MIT')
depends=('gtk2' 'sdl' 'hicolor-icon-theme' 'gtk-update-icon-cache')
install="${pkgname}.install"
source=("http://www.drpetter.se/files/${pkgname}-sdl-${pkgver}.tar.gz")
sha256sums=('ca93be8964c92fe3a2c945640cd3e93c95ae7abe24290818f4fe7f6e5a7cd835')

build() {
  set -u
  cd "${srcdir}/${pkgname}-sdl-${pkgver}"
  # Uncomment below and change the dependences
  # if you plan to use GTK3 instead of GTK2
  # sed -i 's|GTK=3.0|GTK=2.0|' Makefile
  make -s DESTDIR="${pkgdir}"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-sdl-${pkgver}"
  make -s DESTDIR="${pkgdir}" install
  set +u
}
set +u
