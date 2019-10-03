# $Id$
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=lovelock-backgrounds
pkgver=14.91.1
pkgrel=6
_rhver="${pkgver}-16.fc31"
pkgdesc="Fedora 15 (Lovelock) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_15"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('ac2f5abed577869067cf6988a6f3c68f7a43938d5e44003073dcd8130a33ffa4')

prepare()  {
  tar -xvJf ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}.spec
}

build() {
  cd ./${pkgname}-${pkgver}
  make
}

package() {    
  cd ./${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
# vim:set ts=2 sw=2 et:
