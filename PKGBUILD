# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=schroedinger-cat-backgrounds
pkgver=18.91.0
pkgrel=2
_rhver="${pkgver}-6.fc26"
pkgdesc="Fedora 19 (Schroedinger Cat) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_19"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/s/${pkgname}-${_rhver}.src.rpm")
sha256sums=('e610392f9718f936735ff016861b63ba8b8d20335e46409f64440e69e8ef9f73')

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
