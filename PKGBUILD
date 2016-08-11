# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=leonidas-backgrounds
pkgver=11.0.0
pkgrel=1
_rhver="${pkgver}-11.fc24"
pkgdesc="Fedora 11 (Leonidas) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_11"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
md5sums=('41aedb6a123feb422d6dcf3b18a87ef1')

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
