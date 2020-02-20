# $Id$
# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f30-backgrounds
pkgver=30.1.2
pkgrel=3
_rhver="30.1.2-3.fc32"
pkgdesc="Fedora 30 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Artwork/MediaArt/F30"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('dfdd7cb643ebfe884ef2f869ae5f8f2004dfb3f1e90c85a2aed4800649a51bbe')

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
