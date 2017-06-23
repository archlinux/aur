# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=solar-backgrounds
pkgver=0.92.0
pkgrel=2
_rhver="${pkgver}-13.fc26"
pkgdesc="Fedora 10 (Cambridge) solar backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_10"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/s/${pkgname}-${_rhver}.src.rpm")
sha256sums=('41e293890e800cd210c410cd1dd1f170975261b55d371e2cab86802b0553905b')

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
