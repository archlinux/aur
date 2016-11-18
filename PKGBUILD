# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-alsa
pkgver=0.2.3
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc="OCaml ALSA bindings"
url="https://github.com/savonet/ocaml-alsa"
depends=('ocaml' 'alsa-lib')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-alsa/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('bf14e0c419a8141a56a1cede08577843')

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
