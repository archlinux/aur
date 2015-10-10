# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-mm
pkgver=0.3.0
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml multimedia library")
url="https://github.com/savonet/ocaml-mm"
depends=('ocaml' 'ocaml-alsa' 'ocaml-ao' 'ocaml-pulseaudio' 'ocaml-gstreamer' 'ocaml-mad' 'ocaml-ogg' 'ocaml-ocamlsdl' 'ocaml-theora' 'ffmpeg')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-mm/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('6f29ba0342179d1eeff5314915b9572b')

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
