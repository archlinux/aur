# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ao
pkgver=0.2.1
pkgrel=2
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc="OCaml libao bindings"
url="https://github.com/savonet/ocaml-ao"
depends=('ocaml' 'libao')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-ao/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
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
