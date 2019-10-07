# $Id$
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=solar-backgrounds
pkgver=0.92.0
pkgrel=6
_rhver="${pkgver}-18.fc31"
pkgdesc="Fedora 10 (Cambridge) solar backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_10"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/s/${pkgname}-${_rhver}.src.rpm")
sha256sums=('55b890f4a4e3a47f1d354e9177839554cc0e9cffd808a13bb2a6dcf82bedda84')

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
