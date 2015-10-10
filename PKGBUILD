# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-frei0r
pkgver=0.1.1
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings to the frei0r video API")
url="https://github.com/savonet/ocaml-frei0r"
depends=('ocaml' 'frei0r-plugins')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-frei0r/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('20ee88a65427e7f492b31e2a17cc7911')

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
