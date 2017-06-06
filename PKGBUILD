# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-opus
pkgver=0.1.2
pkgrel=1
pkgdesc="OCaml bindings for Opus audio codec"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-opus"
license=('GPL2')
depends=('ocaml' 'opus' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-opus/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('dd96c90b18ac838e3680dd5127dc67c9')

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
