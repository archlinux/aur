# Maintainer: Leandro Guedes <leanndroguedes@gmail.com>

pkgname=f32-backgrounds
pkgver=32.1.4
pkgrel=1
_relnum=32
pkgdesc="Fedora ${_relnum} backgrounds"
arch=('i686' 'x86_64')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('CC-BY-SA')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/f${_relnum}-backgrounds-${pkgver}-${pkgrel}.fc33.src.rpm")
sha256sums=('edead84f6f69b0511fe7259af2442b17b42ce1775c8f42526658f3d9ed8aecac')

prepare() {
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

#vim: syntax=sh
