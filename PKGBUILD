# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-duppy
pkgver=0.5.2
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml asynchronous scheduler and monad for server-oriented programming")
url="https://github.com/savonet/ocaml-duppy"
depends=('ocaml' 'ocaml-pcre')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-duppy/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('61e211489bb7c3106b63db7ac03e3f7c')

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
