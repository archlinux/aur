# Maintainer: Leandro Guedes <leanndroguedes@gmail.com>

pkgname=f32-backgrounds
pkgver=32.2.2
pkgrel=1
_relnum=32
pkgdesc="Fedora ${_relnum} backgrounds"
arch=('i686' 'x86_64')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('CC-BY-SA')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/f${_relnum}-backgrounds-${pkgver}-${pkgrel}.fc33.src.rpm")
sha256sums=('9a57e725d25ae895db0d041f9478ad0b5cb0bbbded8912b957bd58378d3087df')

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
