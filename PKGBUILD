# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
pkgname=goddard-backgrounds
pkgver=13.0.0
pkgrel=3
_rhver="${pkgver}-12.fc27"
pkgdesc="Fedora 13 (Goddard) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_13"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/g/${pkgname}-${_rhver}.src.rpm")
sha1sums=('260d7ac61738ecb3ae8d3d12c6c49a79e92c4cc2')

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
