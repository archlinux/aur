# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=minisat
pkgver=2.2.0
pkgrel=1
pkgdesc="Minimalistic, open-source SAT solver."
arch=('i686' 'x86_64')
url="http://minisat.se/"
license=('MIT')
depends=()
makedepends=()
optdepends=()
changelog=
source=(${url}downloads/$pkgname-$pkgver.tar.gz)
md5sums=('99a2eaabe528cd366100e4bc0327d22e')

build() {
  export MROOT="$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
  cd "core"
  make
}

package() {
  cd "$srcdir/$pkgname"
  cd "core"
  mkdir -p "$pkgdir/usr/bin"
  cp "minisat" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
