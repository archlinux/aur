# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-duppy
pkgver=0.9.0
pkgrel=1
pkgdesc="OCaml asynchronous scheduler and monad for server-oriented programming"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-duppy"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-pcre')
makedepends=('dune')
options=('!strip')
source=("https://github.com/savonet/ocaml-duppy/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}

sha256sums=('e5674cb25d53e0f871106489067422e6e9daa4225cc0669bdeab11b6e7cb2fbc')
