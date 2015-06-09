# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-syslog
pkgver=1.4
pkgrel=3
pkgdesc="syslog protocol implementation for OCaml"
arch=('i686' 'x86_64')
url="http://homepage.mac.com/letaris/"
license=('LGPL')
source=(http://launchpad.net/ubuntu/+archive/primary/+files/syslog-ocaml_$pkgver.orig.tar.gz)
md5sums=('3042185e6f511aea9956cd8f172b1a84')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')

build () {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  make reallyall
}

package () {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

  mkdir -p "${OCAMLFIND_DESTDIR}"
  OCAMLFIND_DESTDIR=$OCAMLFIND_DESTDIR make install
}
