# Maintainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=cppaper
pkgver=0.10.0
pkgrel=1
makedepends=('meson' 'gcc')
pkgdesc="A Static Site/Blog Generator written in c++"
arch=("x86_64")
url="https://cppaper.yurisantos.dev/"
license=('MIT')
provides=('cppaper')
changelog=
source=("https://github.com/Yrds/cppaper/archive/refs/tags/$pkgver.tar.gz")
b2sums=("5f07cb19011454bf23d56a2ea0340cff07d67e143fb2c0c2e602d6af28c4326873a7f667d651a458f238f02c96bb6fae8a90bcebcfca26af03f99602d34fb905")
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
