# $Id$
# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f30-backgrounds
pkgver=30.0.0
pkgrel=1
_rhver="${pkgver}-2.fc31"
pkgdesc="Fedora 30 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Artwork/MediaArt/F30"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('e39685c5be40a7a6e2c6a426f59103f1c88b6704d03c29aad2c8f7b8f356b9dd')

prepare()  {
  tar -xvJf ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}.spec
}

build() {
  cd ./${pkgname}
  make
}

package() {    
  cd ./${pkgname}
  make install DESTDIR="${pkgdir}"
}
# vim:set ts=2 sw=2 et:
