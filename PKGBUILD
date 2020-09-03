# Maintainer: Leandro Guedes <leandroguedes@protonmail.com>

pkgname=f33-backgrounds
pkgver=33.0.3
pkgrel=1
_relnum=33
pkgdesc="Fedora ${_relnum} backgrounds"
arch=('i686' 'x86_64')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('CC-BY-SA')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/f${_relnum}-backgrounds-${pkgver}-${pkgrel}.fc34.src.rpm")
sha256sums=('c90618ae9c1f8733542757b609b0905f76c1f42edbc0022e10e78cab5db56236')

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
