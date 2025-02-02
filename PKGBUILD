# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ao
pkgver=0.2.4 # renovate: datasource=github-tags depName=savonet/ocaml-ao
pkgrel=1
pkgdesc="OCaml libao bindings"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ao"
license=('LGPL2.1')
depends=('ocaml' 'libao')
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

sha256sums=('0b845e7c04440de3efda9e0cd1e2b115fe069be3fb3ddba5bfd8fed73901a66e')
