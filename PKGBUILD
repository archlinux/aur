# Maintainer: Manuel <mail mdomlop google>

_pkgname=birthday
pkgname=${_pkgname}-es
pkgver=1.6.2
pkgrel=1
pkgdesc="Translated to spanish version of birthday"
url="http://sourceforge.net/projects/birthday/"
license=('GPL')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.bz2" "bdengine-spanish.patch")
sha256sums=('355ad07ad3312d8f5c5b54c71596ac3a0e706c539167900d73cb65df30c8e2f4' '074e6776d95e64885ea2b2d3294bb36bf1a9e3e9705d9aa05fc6d320c0740ca7')
provides=('birthday')
conflicts=('birthday')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch < ../../bdengine-spanish.patch
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
