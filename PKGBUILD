# Maintainer: Yiyun Liu <liuyiyun@seas.upenn.edu>

pkgname=coq-stdpp
pkgver=1.12.0
pkgrel=1
license=('BSD-3-Clause')
arch=('x86_64')
pkgdesc='An extended "Standard Library" for Coq'
url="https://coqhammer.github.io/"
depends=('coq')
makedepends=('dune')
source=("https://gitlab.mpi-sws.org/iris/stdpp/-/archive/coq-stdpp-1.12.0/stdpp-coq-stdpp-${pkgver}.tar.gz")
options=('!strip')
md5sums=('1ef912b07d2d5ca6b71ab2007c8d2c2c')

build() {
  cd "stdpp-coq-stdpp-${pkgver}"
  OCAMLPATH=/usr/lib dune build -p coq-stdpp
}

package() {
  cd "stdpp-coq-stdpp-${pkgver}"
  OCAMLPATH=/usr/lib DESTDIR="${pkgdir}" dune install coq-stdpp \
		     --prefix "/usr" --libdir "/usr/lib/" --docdir "/usr/share/doc"
}
