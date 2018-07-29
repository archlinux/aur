# Maintainer: crave <crave@infinity>

pkgname=kremlin
pkgver=0.9.6.0
pkgrel=2
pkgdesc="a tool for extracting low-level F* programs to readable C code"
arch=('i686' 'x86_64')
url='https://github.com/FStarLang/kremlin'
license=('Apache-2.0')
options=('!strip' '!makeflags' 'staticlibs')
depends=('fstar-git' 'ocaml' 'fstar-ulib' 'ocaml-fstar' 'ocaml-batteries' 'ocaml-ppx_deriving_yojson' 'ocaml-zarith' 'ocaml-stdint' 'ocaml-pprint' 'ocaml-menhir' 'ulex-git' 'ocaml-process' 'ocaml-fix' 'ocaml-wasm' 'ocaml-visitors')
source=('https://github.com/FStarLang/kremlin/archive/v0.9.6.0.tar.gz')
sha384sums=('12c9649424cc8c5ccc4ec21c87c6efd8bb8a60d5150401c482a9f8451c971417489ee84d09f5f7ac03a2c2740470a12f')

build() {
  cd "$srcdir/"*/
  export FSTAR_HOME=/opt/fstar
  export PATH="$PATH:$FSTAR_HOME/bin"
  make -j4
}

package() {
  cd "$srcdir/"*/
  export PREFIX="$pkgdir/usr"
  make install
}
