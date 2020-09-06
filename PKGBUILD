# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-alsa
pkgver=0.3.0
pkgrel=1
pkgdesc="OCaml ALSA bindings"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-alsa"
license=('GPL2')
depends=('ocaml' 'alsa-lib')
makedepends=('dune' 'git')
options=('!strip' '!makeflags')
source=("https://github.com/savonet/${pkgname}/archive/${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dune build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}
md5sums=('abe2eed424387f316e09d90886c3dde1')
