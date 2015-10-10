# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-shine
pkgver=0.2.1
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml binding to the fixed-point mp3 encoding library shine")
url="https://github.com/savonet/ocaml-shine"
depends=('ocaml' 'shine')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-shine/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('0f8921966ac445295425cc52af3a84a6')

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
