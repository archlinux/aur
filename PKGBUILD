# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-faad
pkgver=0.5.1
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

sha256sums=('f62a7c4a48177ab6fab199502a335ceeea88f53e503d679c18fcc1b5343f20fd'
'skip')

