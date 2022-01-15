# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-pulseaudio
pkgver=0.1.5
pkgrel=1
pkgdesc="OCaml bindings for pulseaudio"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-pulseaudio"
license=('LGPL2.1')
depends=('ocaml' 'libpulse')
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

md5sums=('007d7ad74bab49c36644b13e651c2680')
