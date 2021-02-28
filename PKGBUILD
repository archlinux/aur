# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-faad
pkgver=0.5.0
pkgrel=1
pkgdesc="OCaml bindings for the libfaad AAC decoder library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-faad"
license=('GPL2')
depends=('ocaml' 'faad2')
makedepends=('ocaml-findlib' 'dune')
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

sha256sums=('9c03711d0d65ffb0c7860addf271c7a28667f840fab563432d12c28ae9701b5f')

