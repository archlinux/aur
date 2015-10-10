# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-portaudio
pkgver=0.2.1
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings for portaudio")
url="https://github.com/savonet/ocaml-portaudio"
depends=('ocaml' 'portaudio')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-portaudio/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('c504a0d47c1aa834b774b9c668b65691')

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
