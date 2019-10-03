# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f29-backgrounds
pkgver=29.1.3
pkgrel=3
_rhver="${pkgver}-3.fc31"
pkgdesc="Fedora 29 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F29_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('f3bcf1f972d0b5df9514d908b1b106637ef85c62b2d9b432d19c09c8332a38d4')

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
