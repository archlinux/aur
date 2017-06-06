# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-fdkaac
pkgver=0.2.1
pkgrel=2
pkgdesc="OCaml bingind for the fdk-aac library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-fdkaac"
license=('GPL2')
depends=('ocaml' 'libfdk-aac')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-fdkaac/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('fff652fa282b4954d2f504ca1c2a70e9')

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
