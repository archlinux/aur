# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-portaudio
pkgver=0.2.1
pkgrel=1
pkgdesc="OCaml bindings for portaudio"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-portaudio"
license=('LGPL2.1')
depends=('ocaml' 'portaudio')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-portaudio/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
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
