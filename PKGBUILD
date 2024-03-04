# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak (at) gmail [dot] com>

pkgname=mads
pkgver=2.1.5
pkgrel=1
pkgdesc="MADS is a multi-pass crossassembler designed for 6502 and 65816 processors"
arch=('x86_64')
url="http://mads.atari8.info/"
source=(
    https://github.com/tebe6502/Mad-Assembler/archive/refs/tags/$pkgver.tar.gz
    )

sha256sums=(
    '78ca9c4ad907362dc1142f4c6116767cc8c2a426044079269652040f01477363'
    )
license=('unknown')
provides=('mads')
depends=('glibc')
makedepends=('fpc')

build() {
  cd "$srcdir/Mad-Assembler-$pkgver"
  fpc -Mdelphi -vh -O3 mads.pas
}

package() {
  cd "$srcdir/Mad-Assembler-$pkgver"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 mads "$pkgdir/usr/bin"
}
