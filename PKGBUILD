# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=laughlin-backgrounds
pkgver=14.1.0
pkgrel=4
_rhver="${pkgver}-16.fc29"
pkgdesc="Fedora 14 (Laughlin) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_14"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('92a7eb0d237f9a90c3c8d03ae79b8968785b176c92c475898a57c890d289f153')

prepare()  {
  tar -xv --lzma -f ./${pkgname}-${pkgver}.tar.lzma
  rm -r ./${pkgname}-${pkgver}.tar.lzma
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
