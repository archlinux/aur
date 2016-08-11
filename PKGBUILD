# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=verne-backgrounds
pkgver=15.92.1
pkgrel=1
_rhver="${pkgver}-10.fc24"
pkgdesc="Fedora 16 (Verne) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_16"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/v/${pkgname}-${_rhver}.src.rpm")
md5sums=('d1c6a7f1440fc7405e289ea15a0ae993')

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
