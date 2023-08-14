# Maintainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=cppaper
pkgver=0.20.0
pkgrel=1
makedepends=('meson' 'gcc')
pkgdesc="A Static Site/Blog Generator written in c++"
arch=("x86_64")
url="https://cppaper.yurisantos.dev/"
license=('MIT')
provides=('cppaper')
changelog=
source=("https://github.com/Yrds/cppaper/archive/refs/tags/$pkgver.tar.gz")
b2sums=("28f8c1b97f572981cd03902592da666c9eb3801d0da9b8316ced1c9a6e6502b5ec524a696959217bd7995464e4e5d88982111a0a1d0ad5aebf26ebb68975b21b")
validpgpkeys=()

build() {
  cd $srcdir/$pkgname-$pkgver/
  rm -rf build
  meson setup build
  meson compile -C build
}

package() {
  meson install -C $srcdir/$pkgname-$pkgver/build --destdir $pkgdir/

}
