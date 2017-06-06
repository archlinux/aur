# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-mad
pkgver=0.4.5
pkgrel=2
pkgdesc="OCaml bindings to the MAD mp3 decoder"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-mad"
license=('GPL2')
depends=('ocaml' 'libmad')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-mad/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
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
