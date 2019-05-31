# $Id$
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
pkgname=fedorainfinity-backgrounds
pkgver=0.0.5
pkgrel=5
_rhver="${pkgver}-18.fc30"
pkgdesc="Fedora 8 (Werewolf) infinity backgrounds."
arch=("i686" "x86_64")
conflicts=('infinity-background')
provides=('infinity-background')
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_8"
license=("GPL")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('8beba0be97f3969def7b6bef64f4512b820430f5bbddae88ad6c132dcd1988bb')

prepare()  {
  tar -xvjf ./desktop-backgrounds-infinity-${pkgver}.tar.bz2
  rm -r ./desktop-backgrounds-infinity-${pkgver}.tar.bz2
  rm -r ./${pkgname}.spec
}

package() {    
  mkdir -p ${pkgdir}/usr/share/backgrounds/infinity
  mkdir -p ${pkgdir}/usr/share/gnome-background-properties
  cp -a ./desktop-backgrounds-infinity-${pkgver}/{infinity.xml,*.png} ${pkgdir}/usr/share/backgrounds/infinity/
  cp -a ./desktop-backgrounds-infinity-${pkgver}/desktop-backgrounds-infinity.xml ${pkgdir}/usr/share/gnome-background-properties/
}
# vim:set ts=2 sw=2 et:
