# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-flac
pkgver=0.1.5
pkgrel=1
pkgdesc="OCaml bindings to libFLAC"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-flac"
license=('GPL')
depends=('ocaml' 'flac' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-flac/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8cdadec3986460d5e5dc6a5af690b4b2e2c8414469ab1e84350a8ef77069fa0883ac138138dd9e0e48abe7356c5c623048510e0854e85f2cce70ef8cbe7ce9fb')

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
