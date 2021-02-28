# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ogg
pkgver=0.6.1
pkgrel=1
pkgdesc="OCaml binding to libogg"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ogg"
license=('LGPL2.1')
depends=('ocaml' 'libogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

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

sha256sums=('717b8d316e098f242c4c9e7a4cd1bd08ea39a2a328870e498acaddba361a6bbe')
