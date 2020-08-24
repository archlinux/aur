# Maintainer: Leandro Guedes <leandroguedes@protonmail.com>

pkgname=f33-backgrounds
pkgver=33.0.2
pkgrel=1
_relnum=33
pkgdesc="Fedora ${_relnum} backgrounds"
arch=('i686' 'x86_64')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('CC-BY-SA')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/f${_relnum}-backgrounds-${pkgver}-${pkgrel}.fc34.src.rpm")
sha256sums=('ecdf9eec04413fb35b9d64d053d8ce39af0c3c838451cc61c054468a822d2c3f')

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
