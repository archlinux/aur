# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lame
pkgver=0.3.3
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings to the LAME mp3 encoder")
url="https://github.com/savonet/ocaml-lame"
depends=('ocaml' 'lame')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-lame/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('a1585835f94f8d459157263ed2aaede3')

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
