# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-taglib
pkgver=0.3.2
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings to taglib")
url="https://github.com/savonet/ocaml-taglib"
depends=('ocaml' 'taglib')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-taglib/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('67d7274db0626d21f8a2f780d413616b')

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
