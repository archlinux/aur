# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-alsa
pkgver=0.3.0
pkgrel=4
_commit=00c17a5653875b8401f22c7ccd5ceaf5998b53ef
pkgdesc="OCaml ALSA bindings"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-alsa"
license=('GPL2')
depends=('ocaml' 'alsa-lib')
makedepends=('ocaml-findlib' 'dune')
options=('!strip' '!makeflags')
source=("https://github.com/savonet/${pkgname}/archive/${_commit}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${_commit}"

  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('a7d8b6db909647418017e81cfb481c73609fb69d5c66b8ffaf0ed57f7e850c74')
