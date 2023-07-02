# Maintainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=cppaper
pkgver=0.17.5
pkgrel=1
makedepends=('meson' 'gcc')
pkgdesc="A Static Site/Blog Generator written in c++"
arch=("x86_64")
url="https://cppaper.yurisantos.dev/"
license=('MIT')
provides=('cppaper')
changelog=
source=("https://github.com/Yrds/cppaper/archive/refs/tags/$pkgver.tar.gz")
b2sums=("62713a38a0a8f00025498305fe4dc28d24556d72c2af81ce3014e989bda5996a9b01afdf219239142a082f7dd50bbac887f34f89610ec1fa14b702d4fd197c5d")
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
