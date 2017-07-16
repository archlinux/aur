# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-taglib
pkgver=0.3.2
pkgrel=2
pkgdesc="OCaml bindings to taglib"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-taglib"
license=('LGPL2.1')
depends=('ocaml' 'taglib')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-taglib/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
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
