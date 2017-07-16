# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=f26-backgrounds
pkgver=26.2.6
pkgrel=1
_rhver="${pkgver}-1.fc27"
pkgdesc="Fedora 26 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F26_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('39ada5982a1e20e39055ab11568fb9542727eb0166b4a1e1b32d666078cd4f9b')

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
