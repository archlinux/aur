# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-dtools
pkgver=0.4.1
pkgrel=1
pkgdesc="OCaml modules for writing daemons"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-dtools"
license=('GPL2')
depends=('ocaml' 'ocaml-syslog')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-dtools/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f211ec4634755271b80bf5d71091f21c')

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
