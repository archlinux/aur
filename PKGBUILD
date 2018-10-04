# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-taglib
pkgver=0.3.5
pkgrel=1
pkgdesc="OCaml bindings to taglib"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-taglib"
license=('LGPL2.1')
depends=('ocaml' 'taglib')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-taglib/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d9059445acea347261666efa8808fa8c8794aacaec042a103336acf803472a2838686f3e8422975b0f80e8ea9f0faeaa763fe38b9799ff6067b23caa2c6e5f75')

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
