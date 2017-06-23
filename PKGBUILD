# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=spherical-cow-backgrounds
pkgver=18.0.0
pkgrel=2
_rhver="${pkgver}-7.fc26"
pkgdesc="Fedora 18 (Spherical Cow) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_18"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/s/${pkgname}-${_rhver}.src.rpm")
sha256sums=('f70a978019307fedd0ad124dc6dffe270926d73ec93ef552808463c848708c7d')

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
