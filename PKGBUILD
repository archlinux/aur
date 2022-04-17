# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Submitter: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=packmol
epoch=1
pkgver=20.3.5
pkgrel=1
pkgdesc="Creates an initial point for molecular dynamics simulations by packing molecules in defined regions of space."
depends=(tcl)
makedepends=(gcc-fortran)
arch=($CARCH)
license=(MIT)
url="http://www.ime.unicamp.br/~martinez/packmol/"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mcubeg/packmol/archive/v$pkgver.tar.gz")
sha256sums=('cde64dbe212ea6569d656f4800af7cba3e40f1492b5e51195b4ce9fc7040c0c0')

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
