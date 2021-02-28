# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-vorbis
pkgver=0.7.1
pkgrel=1
pkgdesc="OCaml bindings to lbvorbis"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-vorbis"
license=('GPL2')
depends=('ocaml' 'libvorbis' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

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

sha256sums=('26c6bf9d5c3ed3c737fde4caf473d0b65e170f4806ad9ea25beb9723c8da0d6d')

