# $Id$
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=verne-backgrounds
pkgver=15.92.1
pkgrel=5
_rhver="${pkgver}-15.fc30"
pkgdesc="Fedora 16 (Verne) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_16"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/v/${pkgname}-${_rhver}.src.rpm")
sha256sums=('700a2dc396fdd7dd272875f30582aead2dc00683af67dd76aa496b914da7e605')

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
