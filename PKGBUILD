# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-aacplus
pkgver=0.2.2
pkgrel=2
pkgdesc="OCaml bindings for libaacplus"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-aacplus"
license=('LGPL2.1')
depends=('ocaml' 'libaacplus' 'fftw')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-aacplus/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('968fe7a5ebebfb6182705271e3920c0a')

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
