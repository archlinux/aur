# Maintainer: malet <malet@invalid>
pkgname=ocaml-visitors
_oname=visitors
pkgver=20180513
pkgrel=1
pkgdesc='An OCaml syntax extension for generating visitor classes.'
arch=('i686' 'x86_64')
url='https://gitlab.inria.fr/fpottier/visitors'
license=('LGPL')
depends=('ocaml' 'ocaml-ppx_deriving')
options=('!strip' '!makeflags' 'staticlibs')
source=('http://gallium.inria.fr/~fpottier/visitors/visitors-20180513.tar.gz')
md5sums=('0f90d565d045c2df3769239ac1d39b76')

build() {
  cd "$srcdir/$_oname-$pkgver"
  make -C src
}

package() {
  cd "$srcdir/$_oname-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make -C src install
}
