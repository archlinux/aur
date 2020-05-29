# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-alsa
pkgver=0.2.3
pkgrel=3
pkgdesc="OCaml ALSA bindings"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-alsa"
license=('GPL2')
depends=('ocaml' 'alsa-lib')
makedepends=('dune' 'git')
options=('!strip' '!makeflags')
source=("${pkgname}-${pkgver}::git+https://github.com/savonet/ocaml-alsa.git#commit=8e5578d2bc80c4ecb01ebf9d0f642db840ae46f1")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dune build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}
md5sums=('SKIP')
