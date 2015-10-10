# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-flac
pkgver=0.1.2
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings to libFLAC")
url="https://github.com/savonet/ocaml-flac"
depends=('ocaml' 'flac' 'ocaml-ogg')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-flac/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('00944c4f2f2016770fa6e8f948561669')

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
