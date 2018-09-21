# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=f28-backgrounds
pkgver=28.1.5
pkgrel=1
_rhver="1.fc29"
pkgdesc="Fedora 28 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F28_Artwork"
license=("CC-BY-SA")
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/${pkgname}-${pkgver}-${_rhver}.src.rpm")


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

md5sums=('ea3ccdce35b11a2c4633871a9f8ee03d')
