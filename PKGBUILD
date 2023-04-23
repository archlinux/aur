# Maintainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=cppaper
pkgver=0.13.1
pkgrel=1
makedepends=('meson' 'gcc')
pkgdesc="A Static Site/Blog Generator written in c++"
arch=("x86_64")
url="https://cppaper.yurisantos.dev/"
license=('MIT')
provides=('cppaper')
changelog=
source=("https://github.com/Yrds/cppaper/archive/refs/tags/$pkgver.tar.gz")
b2sums=("6f9189365809741b6b976f82d52d20815e42c36515851f6ec9062ed9373df212eb6ee78df7cf8adf185e6546eab335bfc36d36447a2086bccc1d185a9cb59369")
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
