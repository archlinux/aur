# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=constantine-backgrounds
pkgver=12.1.1
pkgrel=2
_rhver="${pkgver}-12.fc26"
pkgdesc="Fedora 12 (Constantine) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_12"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/c/${pkgname}-${_rhver}.src.rpm")
sha1sums=('32518afe6cbd2f31cc31dedc0d4b1b89a56f9ab0')

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

