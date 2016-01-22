# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=halide-bin
pkgver=20151217
pkgrel=1
pkgdesc="A language for image processing and computational photography, precompiled version."
arch=('x86_64')
url="http://halide-lang.org/"
license=('MIT')
depends=('gcc>4.6')
source_i686=("https://github.com/halide/Halide/releases/download/release_2015_12_17/halide-linux-32-gcc49-trunk-7c6a3e25caa31a3c466f97a5b6e4281c0f3a3678.tgz")
source_x86_64=("https://github.com/halide/Halide/releases/download/release_2015_12_17/halide-linux-64-gcc49-trunk-7c6a3e25caa31a3c466f97a5b6e4281c0f3a3678.tgz")
md5sums_i686=("d4c8d9f86f7c28dbe4e53f24d5b0a4a4")
md5sums_x86_64=("8f0f42e44b3aa95d7771582577b6f27f")

package() {
  cd "$srcdir/halide"
  install -Dm755 bin/libHalide.a  "$pkgdir/usr/lib/libHalide.a"
  install -Dm755 bin/libHalide.so "$pkgdir/usr/lib/libHalide.so"
  for i in include/*.h; do
    install -Dm644 $i "$pkgdir/usr/$i"
  done
}


