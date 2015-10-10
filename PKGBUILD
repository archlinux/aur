# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ladspa
pkgver=0.1.5
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings for LADSPA plugins")
url="https://github.com/savonet/ocaml-ladspa"
depends=('ocaml')
makedepends=('ocaml-findlib' 'ladspa')
source=("https://github.com/savonet/ocaml-ladspa/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('ae66337eb15dbbf0f432016e79db7267')

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
