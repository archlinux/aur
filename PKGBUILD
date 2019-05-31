# Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=f27-backgrounds
pkgver=27.0.1
pkgrel=3
_rhver="5.fc30"
pkgdesc="Fedora 27 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F27_Artwork"
license=("CC-BY-SA")
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/${pkgname}-${pkgver}-${_rhver}.src.rpm")
sha256sums=('a4cf5605e911dfc6186882538a948a426f3725b494aac44fa2af58e643e98665')

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
