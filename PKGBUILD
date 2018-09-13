# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-vorbis
pkgver=0.7.1
pkgrel=1
pkgdesc="OCaml bindings to lbvorbis"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-vorbis"
license=('GPL2')
depends=('ocaml' 'libvorbis' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-vorbis/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('341b6f36265c181d3f5da107cbdd8963')

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
