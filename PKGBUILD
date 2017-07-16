# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-voaacenc
pkgver=0.1.1
pkgrel=2
pkgdesc="OCaml bindings for the vo-aacenc AAC encoder"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-voaacenc"
license=('LGPL2.1')
depends=('ocaml' 'vo-aacenc')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-voaacenc/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('9fc233686c26a0ec96b8a9144dc8d95b')

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
