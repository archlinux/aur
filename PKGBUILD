# Maintainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=cppaper
pkgver=0.14.1
pkgrel=1
makedepends=('meson' 'gcc')
pkgdesc="A Static Site/Blog Generator written in c++"
arch=("x86_64")
url="https://cppaper.yurisantos.dev/"
license=('MIT')
provides=('cppaper')
changelog=
source=("https://github.com/Yrds/cppaper/archive/refs/tags/$pkgver.tar.gz")
b2sums=("c926adfad1002537ae8681e9fc7e11df777ff6583c6a6646eb578c2809b60f2689a7d66f614e6b1baecde29c87ee7102a9568762fb975080c53715c5cbb10dac")
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
