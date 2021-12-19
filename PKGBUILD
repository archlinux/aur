# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-samplerate
pkgver=0.1.6
pkgrel=2
pkgdesc="OCaml bindings for libsamplerate"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-samplerate"
license=('BSD')
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

sha256sums=('6bf052fa50cb5a46332a64c773790dfa40cbb8b2ab0fd41bf1659bedc31a48ec')
