# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f26-backgrounds
pkgver=26.2.7
pkgrel=5
_rhver="${pkgver}-6.fc31"
pkgdesc="Fedora 26 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F26_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('5f62c492d470e0f7f9c0841943aef97a5719272158d00de63ea58aab0561a9ea')

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
