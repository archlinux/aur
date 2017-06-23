# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=f23-backgrounds
pkgver=23.1.0
pkgrel=2
_rhver="${pkgver}-3.fc26"
pkgdesc="Fedora 23 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_23"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('3e72273fb09dfa256f4145d152c35c9a7abc47158d1a395f8f268e56d34a49c9')

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
