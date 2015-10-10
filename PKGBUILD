# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-schroedinger
pkgver=0.1.1
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings to libschroedinger")
url="https://github.com/savonet/ocaml-schroedinger"
depends=('ocaml' 'schroedinger' 'ocaml-ogg')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-schroedinger/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('fa6974277a389d0ef5e4a92cbcf416f0')

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
