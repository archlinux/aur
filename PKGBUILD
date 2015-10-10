# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-faad
pkgver=0.3.3
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings for the libfaad AAC decoder library")
url="https://github.com/savonet/ocaml-faad"
depends=('ocaml' 'faad2')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-faad/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('70b3bea8fc805255ff2a7f9aafe55d8c')

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
