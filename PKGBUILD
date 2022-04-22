# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lame
pkgver=0.3.6
pkgrel=1
pkgdesc="OCaml bindings to the LAME mp3 encoder"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-lame"
license=('GPL2')
depends=('ocaml' 'lame')
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

sha256sums=('1b1887dba55e76182355173616670823fe3653507bd47c42c78febe54f195fc9')
