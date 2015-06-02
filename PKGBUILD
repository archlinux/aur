# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=cppo
pkgver=1.1.2
pkgrel=1
pkgdesc="The C preprocessor written in OCaml"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('ocaml-findlib')
url='http://mjambon.com/cppo.html'
source=("http://mjambon.com/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f1a551639c0c667ee8840d95ea5b2ab7')
build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p "${pkgdir}/usr/bin" "$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  make install BINDIR="${pkgdir}/usr/bin"
}
