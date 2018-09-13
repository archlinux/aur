# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ffmpeg
pkgver=0.2.0
pkgrel=1
pkgdesc="OCaml bindings to the FFmpeg library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ffmpeg"
license=('LGPL2.1')
depends=('ocaml' 'ffmpeg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-ffmpeg/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f4315ab1e094196be6276517718ae370')

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
