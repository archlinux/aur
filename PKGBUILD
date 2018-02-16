# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f26-backgrounds
pkgver=26.2.7
pkgrel=2
_rhver="${pkgver}-2.fc27"
pkgdesc="Fedora 26 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F26_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('fb93a8d53fd8d02ce6bd379ae52e4ec59b3aaf0ec1f6145d7da33ba4d4cdd733')

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
