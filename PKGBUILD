# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ogg
pkgver=0.7.2
pkgrel=1
pkgdesc="OCaml binding to libogg"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ogg"
license=('LGPL2.1')
depends=('ocaml' 'libogg')
makedepends=('dune' 'ocaml-findlib')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"
  
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('b4915d9dd31186a38404b2ba6da0ad7bc8eaf4e2c94f0468454386dce9e74892')
