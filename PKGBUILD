# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-cry
pkgver=0.4.1
pkgrel=1
pkgdesc="OCaml native module for icecast/shoutcast source protocol(s)"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-cry"
license=('GPL2')
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-cry/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('297c72df25a6010182b89496108bd8d6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}"
    make install
}
