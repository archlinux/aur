# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak (at) gmail [dot] com>

pkgname=mads
pkgver=2.1.6
pkgrel=1
pkgdesc="MADS is a multi-pass crossassembler designed for 6502 and 65816 processors"
arch=('x86_64')
url="http://mads.atari8.info/"
source=(
    https://github.com/tebe6502/Mad-Assembler/archive/refs/tags/$pkgver.tar.gz
    )

sha256sums=(
    'd09949a63145e2c8489a620fe5541670daac91f38581ec68197685e229372d76'
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
