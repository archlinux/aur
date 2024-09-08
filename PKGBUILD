# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org> 
# Contributor: Jürgen Hötzel <juergen@hoetzel.info>

pkgname=ocaml4-ocamlbuild
pkgver=0.14.2
pkgrel=3
pkgdesc='Build tool, that has built-in rules for building OCaml library and programs'
arch=(x86_64)
url='https://github.com/ocaml/ocamlbuild'
license=(GPL2)
depends=(ocaml4)
conflicts=(ocaml-ocamlbuild)
source=("ocamlbuild-$pkgver.tar.gz::https://github.com/ocaml/ocamlbuild/archive/$pkgver.tar.gz")
b2sums=('d81613878f93f27c6de41461e6b3cebe0744a5204297725263a608cb129a708aaf6f27b444b97d68f2bde844a760f8e78647641f10eed61e727ef3936562cdea')
options=(!makeflags)

build() {
  cd "ocamlbuild-$pkgver"
  make configure PREFIX=/usr MANDIR=/usr/share/man 
  make
}

package() {
  cd "ocamlbuild-$pkgver"
  make DESTDIR="$pkgdir" install
}
