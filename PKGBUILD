# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-mad
pkgver=0.5.2
pkgrel=1
pkgdesc="OCaml bindings to the MAD mp3 decoder"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-mad"
license=('GPL2')
depends=('ocaml' 'libmad')
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

sha256sums=('eb32be151453cfeeadc1d8ca0f767300161ef51222c02770733dd9508629f7b1')
