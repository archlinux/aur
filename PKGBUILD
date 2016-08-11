# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=f23-backgrounds
pkgver=23.1.0
pkgrel=1
_rhver="${pkgver}-2.fc24"
pkgdesc="Fedora 23 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_23"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
md5sums=('af68c55c5758be077b584e93cdb3afb2')

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
