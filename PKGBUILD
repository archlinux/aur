# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-flac
pkgver=0.1.4
pkgrel=1
pkgdesc="OCaml bindings to libFLAC"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-flac"
license=('GPL2')
depends=('ocaml' 'flac' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-flac/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1d485dcbdf9b26e04c62eadf8642ff491f5d7cfb5000759ec28cc9fb885df40347b4877cbf6b05c415e2865aa5f050ff252ad78629cc6348637bb42fdd6a220b')

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
