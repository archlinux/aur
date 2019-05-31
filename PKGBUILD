# $Id$
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=laughlin-backgrounds
pkgver=14.1.0
pkgrel=5
_rhver="${pkgver}-17.fc30"
pkgdesc="Fedora 14 (Laughlin) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_14"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('b1003d31843906d4ed282bf1febe4945131f512530eead8a9cf1ce7eea2e61a5')

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
