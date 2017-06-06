# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-faad
pkgver=0.3.3
pkgrel=2
pkgdesc="OCaml bindings for the libfaad AAC decoder library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-faad"
license=('GPL2')
depends=('ocaml' 'faad2')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-faad/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
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
