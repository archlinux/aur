# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
pkgname=heisenbug-backgrounds
pkgver=20.0.0
pkgrel=3
_rhver="${pkgver}-6.fc27"
pkgdesc="Fedora 20 (Heisenbug) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_20"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/h/${pkgname}-${_rhver}.src.rpm")
sha256sums=('ebec2d54bfe18eab024d91ff6e8a1a4d81c809f3a7025f41fd4502ff64eba97f')

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
