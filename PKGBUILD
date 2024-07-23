# Maintainer: Vojtech Aschenbrenner <v@asch.cz>

pkgname=eprover
pkgver=3.1
pkgrel=1
pkgdesc="E is theorem prover for full first-order logic with equality."
arch=('i686' 'x86_64')
url="http://wwwlehre.dhbw-stuttgart.de/~sschulz/E/E.html"
license=('GPL2')
depends=()
makedepends=()
optdepends=()
changelog=
source=(http://wwwlehre.dhbw-stuttgart.de/~sschulz/WORK/E_DOWNLOAD/V_$pkgver/E.tgz)
sha256sums=('f84db3ec902488d5e166b5915c56e12397fd3660744387a2c5a6f81a5005a986')

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
