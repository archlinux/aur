# Maintainer: Yiyun Liu <liuyiyun@seas.upenn.edu>

pkgname=coq-hammer-tactics
pkgver=1.3.2
pkgrel=1
license=('LGPL-2.1-or-later')
arch=('x86_64')
pkgdesc="Collection of automation tactics for Coq"
url="https://coqhammer.github.io/"
depends=('coq')
makedepends=('ocaml' 'dune' 'ocaml-zarith')
source=("https://github.com/lukaszcz/coqhammer/archive/refs/tags/v${pkgver}+8.20.tar.gz")
options=('!strip')
md5sums=('9fecc706975099981eb8ea648b4340a1')

build() {
  cd "coqhammer-${pkgver}-8.20"
  OCAMLPATH=/usr/lib dune build -p coq-hammer-tactics
}

package() {
  cd "coqhammer-${pkgver}-8.20"
  OCAMLPATH=/usr/lib DESTDIR="${pkgdir}" dune install coq-hammer-tactics \
		     --prefix "/usr" --libdir "/usr/lib/" --docdir "/usr/share/doc"
}
