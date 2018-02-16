# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=f27-backgrounds
pkgver=27.0.1
pkgrel=1
_rhver="1.fc28"
pkgdesc="Fedora 27 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F27_Artwork"
license=("CC-BY-SA")
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/${pkgname}-${pkgver}-${_rhver}.src.rpm")
sha256sums=('8379ac1fedd9d3dd674708c2baaa6561f4a83bcb71f96cf2535e37e2b9cb20c4')

prepare()  {
    tar -xf ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}.spec
}

build() {
    cd ./${pkgname}
    make
}

package() {    
    cd ./${pkgname}
    make install DESTDIR="${pkgdir}"
}
