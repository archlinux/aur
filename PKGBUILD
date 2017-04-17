# Maintainer : Frederic Bezies - <fredbezies at gmail dot com>
# Contributor : Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=goddard-backgrounds
pkgver=13.0.0
pkgrel=2
_rhver="${pkgver}-11.fc26"
pkgdesc="Fedora 13 (Goddard) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_13"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/g/${pkgname}-${_rhver}.src.rpm")
sha1sums=('88893b3773fa9f3fa36ba2ffa6d3b0d37c5d601b')

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

