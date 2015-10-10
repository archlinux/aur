# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-theora
pkgver=0.3.1
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml binding to libtheora")
url="https://github.com/savonet/ocaml-theora"
depends=('ocaml' 'libtheora')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-theora/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('1a5de0e6254178db0da10e96d4d6d13f')

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
