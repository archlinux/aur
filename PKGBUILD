# Maintainer: robertfoster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-opus
pkgver=0.2.1
pkgrel=1
pkgdesc="OCaml bindings for Opus audio codec"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-opus"
license=('GPL2')
depends=('ocaml' 'opus' 'ocaml-ogg')
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

sha256sums=('5c1149e46ac9e67ca160d740937d1cb2a1f05ee142bdc7a186b39198e7b88b30')


