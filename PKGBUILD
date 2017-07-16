# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-schroedinger
pkgver=0.1.1
pkgrel=1
pkgdesc="OCaml bindings to libschroedinger"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-schroedinger"
license=('GPL2')
depends=('ocaml' 'schroedinger' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-schroedinger/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
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
