# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-bjack
pkgver=0.1.6
pkgrel=1
pkgdesc="OCaml blocking JACK API"
url="https://github.com/savonet/ocaml-bjack"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('ocaml' 'jack')
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

sha256sums=('92302504ee2124e82e6ace3e4f07c8b9f16db384ae70b4c1245f9e2b6a7301ed')
