# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Submitter: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=packmol
epoch=1
pkgver=21.2.1
pkgrel=1
pkgdesc="Creates an initial point for molecular dynamics simulations by packing molecules in defined regions of space."
depends=(tcl)
makedepends=(gcc-fortran)
arch=($CARCH)
license=(MIT)
url="http://www.ime.unicamp.br/~martinez/packmol/"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mcubeg/packmol/archive/v$pkgver.tar.gz")
sha256sums=('6b8275be64e425fd578e7606ac22bb586108bc6b5c17d417873bd108928f830f')

build() {
  cd $pkgname-$pkgver

  ./configure
  make -j1
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 packmol "$pkgdir/usr/bin/packmol"
  install -Dm755 solvate.tcl "$pkgdir/usr/bin/solvate.tcl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
