# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=leonidas-backgrounds
pkgver=11.0.0
pkgrel=5
_rhver="${pkgver}-16.fc30"
pkgdesc="Fedora 11 (Leonidas) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_11"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('c98a8c02ebb87d680df1bfc6c73b2683b1c3443cb6e3b4cdb70e56e76ebf8259')

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
