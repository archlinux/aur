# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-opus
pkgver=0.1.3
pkgrel=2
pkgdesc="OCaml bindings for Opus audio codec"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-opus"
license=('GPL2')
depends=('ocaml' 'opus' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-opus/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6f3ce5de1366e8f23e5d43f77806eb6dec9689d3c7e0a4c55776027c10695e7e792147c2ac44a2618d6f058af1660f3e85493ef99369bcfadf1a716426d37138')

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
