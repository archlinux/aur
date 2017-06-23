# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=leonidas-backgrounds
pkgver=11.0.0
pkgrel=2
_rhver="${pkgver}-12.fc26"
pkgdesc="Fedora 11 (Leonidas) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_11"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('b25e9191062a868d407fb6aceae955cda54598fdd29cc1fc366e141811e2c9b6')

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
