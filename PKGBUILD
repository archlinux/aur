# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=beefy-miracle-backgrounds
pkgver=16.91.0
pkgrel=3
_rhver="${pkgver}-10.fc26"
pkgdesc="Fedora 17 (Beefy Miracle) backgrounds."
arch=("any")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_17"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/b/${pkgname}-${_rhver}.src.rpm")
sha1sums=('8b2f228ef7f8e9be58cf759434c8e9c9d09cf0c6')

prepare()  {
    tar -xvJf ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}.spec
}

build() {
    cd ./${pkgname}-${pkgver}
    make
}

package() {    
    cd ./${pkgname}-${pkgver}
    make install DESTDIR="${pkgdir}"
}

