# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f29-backgrounds
pkgver=29.1.3
pkgrel=1
_rhver="${pkgver}-1.fc30"
pkgdesc="Fedora 29 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F29_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('052b7601b7d26a74cf7b536bdb322fa304e3b5731cd4a9d0f4c3e25b11305dfb')

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
