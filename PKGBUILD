# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=fedorainfinity-backgrounds
pkgver=0.0.5
pkgrel=2
_rhver="${pkgver}-14.fc26"
pkgdesc="Fedora 8 (Werewolf) infinity backgrounds."
arch=("i686" "x86_64")
conflicts=('infinity-background')
provides=('infinity-background')
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_8"
license=("GPL")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha1sums=('04d1a92642f859f3bacebb278fecc7c112cd67d9')

prepare()  {
	tar -xvjf ./desktop-backgrounds-infinity-${pkgver}.tar.bz2
    rm -r ./desktop-backgrounds-infinity-${pkgver}.tar.bz2
    rm -r ./${pkgname}.spec
}

package() {    
    mkdir -p ${pkgdir}/usr/share/backgrounds/infinity
    mkdir -p ${pkgdir}/usr/share/gnome-background-properties
    cp -a ./desktop-backgrounds-infinity-${pkgver}/{infinity.xml,*.png}             ${pkgdir}/usr/share/backgrounds/infinity/
    cp -a ./desktop-backgrounds-infinity-${pkgver}/desktop-backgrounds-infinity.xml ${pkgdir}/usr/share/gnome-background-properties/
}

