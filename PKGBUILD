# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ffmpeg
pkgver=0.1.2
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc="OCaml bindings to the FFmpeg library"
url="https://github.com/savonet/ocaml-ffmpeg"
depends=('ocaml' 'ffmpeg')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-ffmpeg/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('b65fcef8c4ac2792976c206648c81f38')

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
