# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-pulseaudio
pkgver=0.1.3
pkgrel=1
pkgdesc="OCaml bindings for pulseaudio"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-pulseaudio"
license=('LGPL2.1')
depends=('ocaml' 'libpulse')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-pulseaudio/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('bd04013ada1a6ed72e111e406befc709')

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
