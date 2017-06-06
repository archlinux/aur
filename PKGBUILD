# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-dssi
pkgver=0.1.2
pkgrel=1
pkgdesc="OCaml bindings for dssi plugins"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-dssi"
license=('GPL2')
depends=('ocaml' 'ocaml-ladspa')
makedepends=('ocaml-findlib' 'dssi' 'ladspa')
options=('!strip')
source=("https://github.com/savonet/ocaml-dssi/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
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
