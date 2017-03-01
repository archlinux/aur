# Maintainer: Vojtech Aschenbrenner <v@asch.cz>

pkgname=eprover
pkgver=1.9.1
pkgrel=1
pkgdesc="E is theorem prover for full first-order logic with equality."
arch=('i686' 'x86_64')
url="http://wwwlehre.dhbw-stuttgart.de/~sschulz/E/E.html"
license=('GPL2')
depends=()
makedepends=()
optdepends=()
changelog=
source=(http://wwwlehre.dhbw-stuttgart.de/~sschulz/WORK/E_DOWNLOAD/V_${pkgver}/E.tgz)
sha256sums=('1c5b5c8fdc3f7c83e6974de15c1861f4636b12225c81542a01d262d7ea3929ee')

build() {
  cd "$srcdir/E"
  ./configure --bindir="/usr/bin"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir/E/PROVER"
  cp "e_axfilter" "$pkgdir/usr/bin"
  cp "e_ltb_runner" "$pkgdir/usr/bin"
  cp "eground" "$pkgdir/usr/bin"
  cp "epclextract" "$pkgdir/usr/bin"
#  cp "eproof" "$pkgdir/usr/bin"
#  cp "eproof_ram" "$pkgdir/usr/bin"
  cp "eprover" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
