# $Id$
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=lovelock-backgrounds
pkgver=14.91.1
pkgrel=5
_rhver="${pkgver}-15.fc30"
pkgdesc="Fedora 15 (Lovelock) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_15"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('2e1294d0784dbdbfa446f14051f37a4e1a073da48eb20814ff506930b3f0df34')

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
