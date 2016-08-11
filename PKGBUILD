# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=spherical-cow-backgrounds
pkgver=18.0.0
pkgrel=1
_rhver="${pkgver}-6.fc24"
pkgdesc="Fedora 18 (Spherical Cow) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_18"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/s/${pkgname}-${_rhver}.src.rpm")
md5sums=('bf546968992c22b0309917fa2c51c06b')

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
