# Maintainer:  Score_Under <seejay.11@gmail.com>

pkgname=ocaml-crunch
pkgver=4.1.0
pkgrel=1
pkgdesc="Convert a filesystem into an OCaml module"
arch=(x86_64)
url="https://github.com/mirage/ocaml-crunch"
license=(ISC)
depends=(ocaml ocaml-ptime)
makedepends=(dune ocaml-cmdliner)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mirage/ocaml-crunch/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6590e53732748a753a16f1669aa61ae80e19c08b96ca7eb8fd429e3664917b022c4397831e51b9f55f84bbbd8207d7f3deb8ad52ecba87ff50cff2f738ed64b1')

build(){
  cd "$srcdir/ocaml-crunch-$pkgver"
  dune build -p crunch
}

package(){
  cd "$srcdir/ocaml-crunch-$pkgver"
  DESTDIR="$pkgdir" dune install -p crunch --prefix=/usr --libdir=/usr/lib/ocaml
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
