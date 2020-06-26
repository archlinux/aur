# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak (at) gmail [dot] com>

pkgname=mads
pkgver=2.1.0
madver=209
pkgrel=1
pkgdesc="MADS is a multi-pass crossassembler designed for 6502 and 65816 processors"
arch=('x86_64')
url="http://mads.atari8.info/"
source=(
    https://github.com/tebe6502/Mad-Assembler/archive/$pkgver.tar.gz
    )

sha256sums=(
    'bba2aa102e41d131adec6f01bb525e874ea6cdb3769f9a31426419587e87d7fa'
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
