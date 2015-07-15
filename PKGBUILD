# Maintainer: Vojtech Aschenbrenner <v@asch.cz>

pkgname=eprover
pkgver=1.9
pkgrel=1
pkgdesc="E is theorem prover for full first-order logic with equality."
arch=('i686' 'x86_64')
url="http://wwwlehre.dhbw-stuttgart.de/~sschulz/E/E.html"
license=('GPL2')
depends=()
makedepends=()
optdepends=()
changelog=
source=(http://wwwlehre.dhbw-stuttgart.de/~sschulz/WORK/E_DOWNLOAD/V_1.9/E.tgz)
sha256sums=('c4365661a6a4519b21b895fafe60c6b39b8acadf77a3c42e4d638027f155376e')

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
