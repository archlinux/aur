# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-cry
pkgver=0.3.0
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml native module for icecast/shoutcast source protocol(s)")
url="https://github.com/savonet/ocaml-cry"
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-cry/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('5730b72e4be65b657caad27c38c0c103')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}"
    make install
}
