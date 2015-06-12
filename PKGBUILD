# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ocaml-objsize
_pkgname=objsize
pkgver=0.16
pkgrel=1
pkgdesc="A small OCaml library for computing size of OCaml values."
arch=('i686' 'x86_64')
url="http://forge.ocamlcore.org/projects/objsize/"
license=('GPL')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=(https://forge.ocamlcore.org/frs/download.php/442/$_pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  make lib
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p ${pkgdir}$(ocamlfind printconf destdir) 
  make install \
    DESTDIR=$pkgdir \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore
}

# vim:set ts=2 sw=2 et:
md5sums=('66f550c611d3a3499454ff906d60b42d')
