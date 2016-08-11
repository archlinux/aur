# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=schroedinger-cat-backgrounds
pkgver=18.91.0
pkgrel=1
_rhver="${pkgver}-5.fc24"
pkgdesc="Fedora 19 (Schroedinger Cat) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_19"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/s/${pkgname}-${_rhver}.src.rpm")
md5sums=('2f58e847f93dd64188b2414f714f6919')

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
