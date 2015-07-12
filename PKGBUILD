# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
_pkgname=libreoffice-style-breeze
pkgname="${_pkgname}-git"
pkgver=df1a5e3
pkgrel=1
pkgdesc='Breeze icons for LibreOffice'
arch=('any')
url="https://github.com/NitruxSA/plasma-next-icons"
license=('GPL')
conflicts=("${_pkgname}")
makedepends=('git' 'zip' 'imagemagick' 'inkscape')
source=("git+${url}")
sha256sums=('SKIP')

build() {
  cd plasma-next-icons/LibreOffice_Breeze
  make
}

pkgver() {
  cd plasma-next-icons
  echo "$(git describe --always |sed 's#-#_#g;s#v##')"
}

package() {
  cd plasma-next-icons/LibreOffice_Breeze
  mkdir -p "${pkgdir}/usr/lib/libreoffice/share/config"
  cp images_breeze.zip images_breeze_dark.zip "${pkgdir}/usr/lib/libreoffice/share/config/"
}

# vim:set ts=2 sw=2 et:
