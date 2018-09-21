# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=leonidas-backgrounds
pkgver=11.0.0
pkgrel=4
_rhver="${pkgver}-15.fc29"
pkgdesc="Fedora 11 (Leonidas) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_11"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('df6c3c6bf692fea4ab74a481d09b8dfb8b299216e38260c06f1936fed826bbf0')

prepare()  {
  tar -xv --lzma -f ./${pkgname}-${pkgver}.tar.lzma
  rm -r ./${pkgname}-${pkgver}.tar.lzma
  rm -r ./${pkgname}.spec
}

package() {    
  mkdir -p ${pkgdir}/usr/share/backgrounds/leonidas
  mkdir -p ${pkgdir}/usr/share/gnome-background-properties
  cp -a ./${pkgname}-${pkgver}/{landscape,lion,leonidas*.xml} ${pkgdir}/usr/share/backgrounds/leonidas/
  cp -a ./${pkgname}-${pkgver}/desktop-backgrounds-*.xml      ${pkgdir}/usr/share/gnome-background-properties/
}
# vim:set ts=2 sw=2 et:
