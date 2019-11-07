# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-fdkaac
pkgver=0.3.1
pkgrel=1
pkgdesc="OCaml bingind for the fdk-aac library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-fdkaac"
license=('GPL')
depends=('ocaml' 'libfdk-aac<=0.1.6')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-fdkaac/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('8f97fbb8748732eb4a3b6e830cee61dc')

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
