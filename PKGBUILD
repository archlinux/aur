# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=schroedinger-cat-backgrounds
pkgver=18.91.0
pkgrel=4
_rhver="${pkgver}-9.fc29"
pkgdesc="Fedora 19 (Schroedinger Cat) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_19"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/s/${pkgname}-${_rhver}.src.rpm")
sha256sums=('6d20715fbc123ac9bce77f9cee18ef1d929f8de9e58112f355ca97272b271bd1')

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
