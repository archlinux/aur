# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lo
pkgver=0.1.1
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings for LO library")
url="https://github.com/savonet/ocaml-lo"
depends=('ocaml' 'liblo')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-lo/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('8534c358aa497e96e6af033a20ba0fc4')

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
