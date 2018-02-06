# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-mm
pkgver=0.3.1
pkgrel=1
pkgdesc="OCaml multimedia library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-mm"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-alsa' 'ocaml-ao' 'ocaml-pulseaudio' 'ocaml-gstreamer' 'ocaml-mad' 'ocaml-ogg' 'ocaml-ocamlsdl' 'ocaml-theora' 'ffmpeg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-mm/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('0f56d0fac3081fe38c832ab50639a309')

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
