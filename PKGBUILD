# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f25-backgrounds
pkgver=25.1.1
pkgrel=5
_rhver="${pkgver}-8.fc31"
pkgdesc="Fedora 25 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F25_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('0952fe3763f21e3877668edbebeb606684c0c82fc47d8f9c45bce799c6ebd8a6')

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
