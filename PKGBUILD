# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-ocamlmod
_pkgname=${pkgname/ocaml-/}
pkgver=0.0.3
pkgrel=2
pkgdesc="OCaml library to generate modules from source files."
url="http://forge.ocamlcore.org/projects/ocamlmod/"
license="LGPL"
arch=("i686" "x86_64")
depends=("ocaml")
makedepends=("ocaml-findlib" "ocaml-fileutils" "ocaml-pcre")
source=("http://forge.ocamlcore.org/frs/download.php/856/ocamlmod-$pkgver.tar.gz")
sha256sums=('23740d023c38b0aa8d8010d8df3ba69b1b93a5c5ebdd5ef5058ced18f88cbb70')
options=(!strip)

build () {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package () {
  cd "$srcdir/$_pkgname-$pkgver"

  make install
}
