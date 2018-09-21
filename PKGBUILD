# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=constantine-backgrounds
pkgver=12.1.1
pkgrel=4
_rhver="${pkgver}-15.fc29"
pkgdesc="Fedora 12 (Constantine) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_12"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/c/${pkgname}-${_rhver}.src.rpm")
sha256sums=('378c2c1b7736ae307493c2f00b5ddf7cb879837645523df6d7614ce3809ca0db')

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
