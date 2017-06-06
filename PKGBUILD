# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ao
pkgver=0.2.1
pkgrel=2
pkgdesc="OCaml libao bindings"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ao"
license=('LGPL2.1')
depends=('ocaml' 'libao')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-ao/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('7f763e8c47e8369274ee400c640532d4')

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
