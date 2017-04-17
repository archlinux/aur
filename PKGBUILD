# Maintainer : Frederic Bezies - <fredbezies at gmail dot com>
# Contributor : Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=heisenbug-backgrounds
pkgver=20.0.0
pkgrel=2
_rhver="${pkgver}-5.fc26"
pkgdesc="Fedora 20 (Heisenbug) backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_20"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/h/${pkgname}-${_rhver}.src.rpm")
sha1sums=('7897762ba182fb7b541d9d5788f00ce30ae92ccd')

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

