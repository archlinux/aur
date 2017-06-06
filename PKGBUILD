# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-frei0r
pkgver=0.1.1
pkgrel=1
pkgdesc="OCaml bindings to the frei0r video API"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-frei0r"
license=('LGPL2.1')
depends=('ocaml' 'frei0r-plugins')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-frei0r/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
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
