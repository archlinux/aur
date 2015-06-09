# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>

pkgname=ocaml-inotify
pkgver=1.0
pkgrel=4
pkgdesc="OCaml bindings for the inotify API"
arch=('i686' 'x86_64')
url="https://github.com/vincenthz/ocaml-inotify"
license=('LGPL')
makedepends=('ocaml' 'ocaml-findlib')
options=('!strip' 'staticlibs')
source=("https://github.com/vincenthz/ocaml-inotify/archive/v$pkgver.tar.gz")
sha256sums=('4b218bb5b9c9a4aa703eedb3052d07e957a99bf7fec5cbba84980335f699d5e4')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -d "$OCAMLFIND_DESTDIR"/inotify
  make OCAMLDESTDIR="$OCAMLFIND_DESTDIR" install
}

# vim:set ts=2 sw=2 et:
