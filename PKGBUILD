# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-gstreamer
pkgver=0.3.0
pkgrel=1
pkgdesc="OCaml bindings for the GStreamer multimedia framework"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-gstreamer"
license=('LGPL2.1')
depends=('ocaml' 'gstreamer' 'gst-plugins-base')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-gstreamer/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f3dc890ea043cbf763015ab989984781')

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
