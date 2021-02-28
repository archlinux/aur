# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-alsa
pkgver=0.3.0
pkgrel=3
pkgdesc="OCaml ALSA bindings"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-alsa"
license=('GPL2')
depends=('ocaml' 'alsa-lib')
makedepends=('ocaml-findlib' 'dune')
options=('!strip' '!makeflags')
source=("https://github.com/savonet/${pkgname}/archive/${_commit}.tar.gz")

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

sha256sums=('fda8ba6dcfcf25b9aa402a1fe13f7d829e28c4436258bf8da6cf3bf43f3c3bb1')
