# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=fedorainfinity-backgrounds
pkgver=0.0.5
pkgrel=1
_rhver="${pkgver}-13.fc24"
pkgdesc="Fedora 8 (Werewolf) infinity backgrounds."
arch=("i686" "x86_64")
conflicts=('infinity-background')
provides=('infinity-background')
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_8"
license=("GPL")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
md5sums=('cd9216cd07436538164cebac0e0f29ca')

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
