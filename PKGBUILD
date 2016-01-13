# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>
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
sha256sums=('975e0cb5e2751a604715eb042a059ef4965aff0318cf4c0553f215ed0964dfdd')

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
