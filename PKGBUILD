# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f29-backgrounds
pkgver=29.1.3
pkgrel=2
_rhver="${pkgver}-2.fc30"
pkgdesc="Fedora 29 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F29_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('69f3dba9a1d70f335b846e52b774eddb4a90418f197adb7db952cd5fd88d7715')

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
