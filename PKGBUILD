# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=beefy-miracle-backgrounds
pkgver=16.91.0
pkgrel=4
_rhver="${pkgver}-11.fc27"
pkgdesc="Fedora 17 (Beefy Miracle) backgrounds."
arch=("any")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_17"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/b/${pkgname}-${_rhver}.src.rpm")
sha1sums=('58719b868271712a622b318fe742ffd07ab84add')

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
