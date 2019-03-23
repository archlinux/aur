# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f26-backgrounds
pkgver=26.2.7
pkgrel=4
_rhver="${pkgver}-5.fc30"
pkgdesc="Fedora 26 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F26_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('44c9620f38d8ffb3e625895d2a9cda275c6e80855c8dd69770d7f84134f950c2')

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
