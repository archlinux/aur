# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=solar-backgrounds
pkgver=0.92.0
pkgrel=4
_rhver="${pkgver}-16.fc29"
pkgdesc="Fedora 10 (Cambridge) solar backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_10"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/s/${pkgname}-${_rhver}.src.rpm")
sha256sums=('6419ea3971d1340ede13c3ed139f8e636cb3913249adbfc8d611b3d429319aa1')

prepare()  {
  tar -xvzf ./solar-${pkgver}.tar.gz
  rm -r ./solar-${pkgver}.tar.gz
  rm -r ./${pkgname}.spec
}

package() {    
  mkdir -p ${pkgdir}/usr/share/backgrounds/solar
  mkdir -p ${pkgdir}/usr/share/gnome-background-properties
  cp -a ./solar-${pkgver}/{solar*.xml,*/}                ${pkgdir}/usr/share/backgrounds/solar/
  cp -a ./solar-${pkgver}/desktop-backgrounds-solar*.xml ${pkgdir}/usr/share/gnome-background-properties/
}
# vim:set ts=2 sw=2 et:
