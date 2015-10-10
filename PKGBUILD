# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-bjack
pkgver=0.1.5
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml blocking JACK API")
url="https://github.com/savonet/ocaml-bjack"
depends=('ocaml' 'jack')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-bjack/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('684b2bac4b55d7ef35c72d42f32eee3f')

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
