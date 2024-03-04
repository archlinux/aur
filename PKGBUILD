# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak (at) gmail [dot] com>

pkgname=mad-pascal
pkgver=1.6.9
pkgrel=2
pkgdesc="Mad-Pascal (MP) is a 32-bit Turbo Pascal compiler for Atari XE/XL."
arch=('x86_64')
url="https://github.com/tebe6502/Mad-Pascal"
source=(
    https://github.com/tebe6502/Mad-Pascal/archive/refs/tags/v$pkgver.tar.gz
    )

sha256sums=(
    'b966351bd6fb990704a8bdc5b895b4f1de9e83450d2cc734ca5e9d50e19f03f2'
    )
license=('unknown')
provides=('mads')
depends=('glibc')
makedepends=('fpc')

build() {
  cd "$srcdir/Mad-Pascal-$pkgver/src"
  fpc -Mdelphi -vh -O3 mp.pas
}

package() {
  cd "$srcdir/Mad-Pascal-$pkgver/src"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 mp "$pkgdir/usr/bin"
}
