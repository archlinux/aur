# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-gstreamer
pkgver=0.2.2
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc="OCaml bindings for the GStreamer multimedia framework"
url="https://github.com/savonet/ocaml-gstreamer"
depends=('ocaml' 'gstreamer' 'gst-plugins-base')
makedepends=('ocaml-findlib')
source=("https://github.com/savonet/ocaml-gstreamer/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('1a04fc3db831492abd713a54e108348f')

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
