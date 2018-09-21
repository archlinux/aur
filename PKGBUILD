# Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=f27-backgrounds
pkgver=27.0.1
pkgrel=2
_rhver="4.fc29"
pkgdesc="Fedora 27 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F27_Artwork"
license=("CC-BY-SA")
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/${pkgname}-${pkgver}-${_rhver}.src.rpm")
sha256sums=('ab74df2f199aacf8993ed1fcabddd3c8addff2908e26e051e2022262e8f3d767')

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
