pkgname=ocaml-psmt2-frontend
_pkgname=psmt2-frontend
pkgver=0.2
pkgrel=1
pkgdesc="A simple parser and type-checker for polomorphic extension of the SMT-LIB 2 language"
arch=('x86_64')
url="https://github.com/Coquera/psmt2-frontend"
license=('Apache2')
depends=('ocaml')
makedepends=('ocaml' 'ocaml-menhir')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OCamlPro-Coquera/psmt2-frontend/archive/$pkgver.tar.gz")
sha256sums=('59c25982fcdae1128dea6f260e76bbfd1dd4fe45b34aa168ae084281f4941303')

build() {
  cd "$_pkgname-$pkgver"
  autoconf

  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/lib/ocaml/psmt2-frontend"
  make DESTDIR="$pkgdir/usr" LIBDIR="$pkgdir/usr/lib/ocaml" install
}
