# Maintainer: oliver < a t >  first . in-berlin . de
# former maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='cryptokit'
pkgname="ocaml-${srcname}"
pkgver='1.161'
pkgrel=1
pkgdesc='Cryptographic primitives for OCaml'
arch=('i686' 'x86_64')
url="http://pauillac.inria.fr/~xleroy/software.html#cryptokit"
license=('LGPL')
depends=('ocaml' 'zlib' 'ocaml-zarith') # OCaml as depend, or only makedepends?
makedepends=('ocaml' 'ocaml-findlib' 'dune')
source=("https://github.com/xavierleroy/cryptokit/archive/release1161.tar.gz")
md5sums=('18591fc3f467bc33681be2cede36b8f1')
sha256=('2c183579f7edbc18f5b3ec8d60e2dfe566d032988a475c22b6c9d450c89cf84f')
options=('staticlibs')

releaseshort () {
  RELNUM=`echo $pkgver | sed -e "s/\.//g"`
}

build() {

    tar -xzvf release1161.tar.gz
    cd cryptokit-release1161
    ./configure

    dune build -p cryptokit
}

package() {
    cd cryptokit-release1161
    dune install -p cryptokit
}
