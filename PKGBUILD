# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=f26-backgrounds
pkgver=26.2.7
pkgrel=1
_rhver="${pkgver}-2.fc27"
pkgdesc="Fedora 26 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F26_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('7959a724f8979971d374daf2ca108d0515d155763937262f0546ec741591dce2')

prepare()  {
    tar -xvJf ./${pkgname}-${pkgver}.tar.xz
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
