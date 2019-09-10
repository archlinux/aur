# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-cry
pkgver=0.6.4
pkgrel=1
pkgdesc="OCaml native module for icecast/shoutcast source protocol(s)"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-cry"
license=('GPL')
depends=('ocaml' 'ocaml-ssl')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-cry/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('443e83db0bf0e8342a67476ffb3729ff486283ec65e2872c186d32255ae5d1df71b5c860a1f4db2ee9222409a4bf539e4d4a64d48242f417d066bfc291d36b2d')

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
