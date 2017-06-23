# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=laughlin-backgrounds
pkgver=14.1.0
pkgrel=2
_rhver="${pkgver}-13.fc26"
pkgdesc="Fedora 14 (Laughlin) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_14"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/l/${pkgname}-${_rhver}.src.rpm")
sha256sums=('e409db86ccc8cfb30b92d535e46ee361ab1f48afebf06e8727aaeda562d07fd6')

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
