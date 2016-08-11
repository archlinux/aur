# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=beefy-miracle-backgrounds
pkgver=16.91.0
pkgrel=1
_rhver="${pkgver}-9.fc24"
pkgdesc="Fedora 17 (Beefy Miracle) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_17"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/b/${pkgname}-${_rhver}.src.rpm")
md5sums=('34eeb7c1f8f751a7344a69ea376b6465')

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
