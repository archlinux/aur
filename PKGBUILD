# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-dssi
pkgver=0.1.2
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings for dssi plugins")
url="https://github.com/savonet/ocaml-dssi"
depends=('ocaml' 'ocaml-ladspa')
makedepends=('ocaml-findlib' 'dssi' 'ladspa')
source=("https://github.com/savonet/ocaml-dssi/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('9fe0b20291e33676e8f33a445e8d3ee8')

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
