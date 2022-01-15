# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ladspa
pkgver=0.2.2
pkgrel=1
pkgdesc="OCaml bindings for LADSPA plugins"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ladspa"
license=('LGPL2.1')
depends=('ocaml')
makedepends=('dune' 'ladspa' 'ocaml-findlib')
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

sha256sums=('da089b3617a6219f69a7c5c4dbe87e6ad2cb1e290008f51c70d2ecfabc4c7e7a')
