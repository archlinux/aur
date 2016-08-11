# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=goddard-backgrounds
pkgver=13.0.0
pkgrel=1
_rhver="${pkgver}-10.fc24"
pkgdesc="Fedora 13 (Goddard) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_13"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/g/${pkgname}-${_rhver}.src.rpm")
md5sums=('a501925ac23c2acec3fd2de47baf5395')

prepare()  {
    tar -xv --lzma -f ./${pkgname}-${pkgver}.tar.lzma
    rm -r ./${pkgname}-${pkgver}.tar.lzma
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
