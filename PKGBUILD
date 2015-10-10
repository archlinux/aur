# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-mad
pkgver=0.4.5
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings to the MAD mp3 decoder")
url="https://github.com/savonet/ocaml-mad"
depends=('ocaml' 'libmad')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-mad/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('d326d7441c40d2bb1359766173306639')

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
