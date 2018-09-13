# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lastfm
pkgver=0.3.2
pkgrel=1
pkgdesc="OCaml API to lastfm radio and audioscrobbler"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-lastfm"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-pcre' 'ocaml-xmlplaylist' 'ocamlnet')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-lastfm/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('4750e5b6af1eada76841c89f46427be6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}"
    make install
}
