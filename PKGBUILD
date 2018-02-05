# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ogg
pkgver=0.5.2
pkgrel=1
pkgdesc="OCaml binding to libogg"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ogg"
license=('LGPL2.1')
depends=('ocaml' 'libogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-ogg/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2f678dccf861a72213fc1a33904d88ee')

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
