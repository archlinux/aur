# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-aacplus
pkgver=0.2.2
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings for libaacplus")
url="https://github.com/savonet/ocaml-aacplus"
depends=('ocaml' 'libaacplus')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-aacplus/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('968fe7a5ebebfb6182705271e3920c0a')

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
