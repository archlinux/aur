# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lame
pkgver=0.3.7
pkgrel=1
pkgdesc="OCaml bindings to the LAME mp3 encoder"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-lame"
license=('GPL2')
depends=('ocaml' 'lame')
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

sha256sums=('6a195addb8417219f59f4aa5644a6c020344d2f212b1dc5a5041010a25efc8a0')
