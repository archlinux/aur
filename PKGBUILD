# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lastfm
pkgver=0.3.3
pkgrel=1
pkgdesc="OCaml API to lastfm radio and audioscrobbler"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-lastfm"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-pcre' 'ocaml-xmlplaylist' 'ocamlnet')
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

sha256sums=('e0c05c3221f0faa09d7c2447573181067bf9f192cadbfadb7b97067c72add73a')
