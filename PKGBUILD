# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-flac
pkgver=0.1.3
pkgrel=1
pkgdesc="OCaml bindings to libFLAC"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-flac"
license=('GPL2')
depends=('ocaml' 'flac' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-flac/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('212f4143a893472cd3bd0611814bbf85')

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
