# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
pkgname=goddard-backgrounds
pkgver=13.0.0
pkgrel=4
_rhver="${pkgver}-14.fc29"
pkgdesc="Fedora 13 (Goddard) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_13"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/g/${pkgname}-${_rhver}.src.rpm")
sha256sums=('1c735f96aed962f7ba427445ccad601b9cc4e8529454283d31aa7afaf5a3c5e6')

prepare()  {
  tar -xv --lzma -f ./${pkgname}-${pkgver}.tar.lzma
  rm -r ./${pkgname}-${pkgver}.tar.lzma
  rm -r ./${pkgname}.spec
}

build() {
  cd ./${pkgname}-${pkgver}
  make
}

package() {    
  cd ./${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
# vim:set ts=2 sw=2 et:
