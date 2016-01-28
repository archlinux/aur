# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Thomas Pani <thomas.pani@gmail.com>

pkgname=ocaml-expect
pkgver=0.0.5
_pkgver=0.0.3
pkgrel=1
pkgdesc="An OUnit extension, which helps testing interactive programs."
arch=('i686' 'x86_64')
url="http://forge.ocamlcore.org/projects/ocaml-expect/"
license=('LGPL')
depends=('ocaml' 'ocaml-pcre' 'ocaml-extlib' 'ocaml-ounit')
makedepends=('ocaml-findlib')
source=("http://forge.ocamlcore.org/frs/download.php/894/$pkgname-$pkgver.tar.gz")
options=(!strip)

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
}
md5sums=('3ac7f4bf2cfa9e7e8375c231be384248')
