# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=leonidas-backgrounds
pkgver=11.0.0
pkgrel=6
_rhver="${pkgver}-17.fc31"
pkgdesc="Fedora 11 (Leonidas) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_11"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('68aacd63c004ad6ba797f848ee6d5759a82cd0233046e261d5229f1687e16763')

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
