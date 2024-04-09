# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lastfm
pkgver=0.3.4
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

sha256sums=('7c3916707ed3d7ffc0dc7d8e3d2ec846b7e51563e313415b75cfa27d4aed134d')
