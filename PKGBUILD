# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-gavl
pkgver=0.1.6
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings for the Gavl video manipulation library")
url="https://github.com/savonet/ocaml-gavl"
depends=('ocaml' 'gavl')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-gavl/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('6a95cb233b1929bd9d54431a7c7c4aa1')

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
