# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-soundtouch
pkgver=0.1.8
pkgrel=3
pkgdesc="OCaml bindings for the soundtouch audio library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-soundtouch"
license=('LGPL2.1')
depends=('ocaml' 'soundtouch')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-soundtouch/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f88084c05ef822bea3ccbde9e01700a6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
    make install
}
