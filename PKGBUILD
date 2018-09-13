# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-faad
pkgver=0.4.0
pkgrel=1
pkgdesc="OCaml bindings for the libfaad AAC decoder library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-faad"
license=('GPL2')
depends=('ocaml' 'faad2')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-faad/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('11685e7b48b283b11b8118a21cf11606')

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
