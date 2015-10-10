# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-vorbis
pkgver=0.6.2
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings to lbvorbis")
url="https://github.com/savonet/ocaml-vorbis"
depends=('ocaml' 'libvorbis' 'ocaml-ogg')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-vorbis/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('bb20473496ea5102c5ccd25aa5ef785d')

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
