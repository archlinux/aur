# Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=f27-backgrounds
pkgver=27.0.1
pkgrel=4
_rhver="6.fc31"
pkgdesc="Fedora 27 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F27_Artwork"
license=("CC-BY-SA")
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/${pkgname}-${pkgver}-${_rhver}.src.rpm")
sha256sums=('ea075d818d03d4027d80d7667c400108cd2cf5928d4763a79fbefb267b0eac63')

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
