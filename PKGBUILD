# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=f28-backgrounds
pkgver=28.1.5
pkgrel=3
_rhver="3.fc31"
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

md5sums=('fdfefed91f981143e5708e2bde7638eb')
