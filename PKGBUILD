# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f31-backgrounds
pkgver=31.0.3
pkgrel=1
_rhver="${pkgver}-1.fc32"
pkgdesc="Fedora 31 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F31_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('6c587e1ee7a74ee6888b2a077d907cf445bad39b79378fbdcbe589200a2a1c20')

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
