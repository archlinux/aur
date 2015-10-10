# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-xmlplaylist
pkgver=0.1.4
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml module to parse various RSS playlist formats")
url="https://github.com/savonet/ocaml-xmlplaylist"
depends=('ocaml' 'ocaml-xmlm')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-xmlplaylist/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('99117433dacb84117af7f01bac67df81')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}"
    make install
}
