# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=lovelock-backgrounds
pkgver=14.91.1
pkgrel=2
_rhver="${pkgver}-11.fc26"
pkgdesc="Fedora 15 (Lovelock) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_15"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('bdc456bdfdb86dd81b8880ae5e2b50b43b88ba7b939e45ff9374d49f58b06838')

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
