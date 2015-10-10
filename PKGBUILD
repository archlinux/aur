# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-speex
pkgver=0.2.1
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings to libspeex")
url="https://github.com/savonet/ocaml-speex"
depends=('ocaml' 'speex' 'ocaml-ogg')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-speex/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('68e3596edc35ce7c4fa010e44abc8770')

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
