# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-speex
pkgver=0.3.0
pkgrel=1
pkgdesc="OCaml bindings to libspeex"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-speex"
license=('GPL2')
depends=('ocaml' 'speex' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-speex/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

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

sha256sums=('dbe8835520bb6033bef9e3307e4b58d7f9c61e288b903ee1a3b63ff7fb213035')
