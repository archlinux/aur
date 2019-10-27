# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak (at) gmail [dot] com>

pkgname=mads
pkgver=2.0.9
madver=209
pkgrel=1
pkgdesc="MADS is a multi-pass crossassembler designed for 6502 and 65816 processors"
arch=('x86_64')
url="http://mads.atari8.info/"
source=(
    http://mads.atari8.info/mads_$(echo $pkgver | sed "s/\.//g")src.7z
    )

sha256sums=(
    '76b1130e1cbfe5965d0d427baa1ccd111b45a67fb277f1ad26aa4fd13311fffb'
    )
license=('unknown')
provides=('mads')
depends=('glibc')
makedepends=('fpc')

build() {
  cd "$srcdir"
  fpc -Mdelphi -vh -O3 mads.pas
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 mads "$pkgdir/usr/bin"
}
