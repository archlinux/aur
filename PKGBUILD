# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ogg
pkgver=0.5.0
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml binding to libogg")
url="https://github.com/savonet/ocaml-ogg"
depends=('ocaml' 'libogg')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-ogg/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('21eaee00d3765b3a78aed78520219a52')

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
