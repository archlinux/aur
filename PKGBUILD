# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-samplerate
pkgver=0.1.5
pkgrel=1
pkgdesc="OCaml bindings for libsamplerate"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-samplerate"
license=('LGPL2.1')
depends=('ocaml' 'libsamplerate')
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

sha256sums=('2c5cdfc490770ae77d383a6ccb3cee153b8303aab41da42882b175a0850f49a3')
