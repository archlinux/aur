# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ffmpeg
pkgver=0.1.1
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml bindings to the FFmpeg library")
url="https://github.com/savonet/ocaml-ffmpeg"
depends=('ocaml' 'ffmpeg')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-ffmpeg/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('7c0c7198c877d72668a14c6d4400ba8c')

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
