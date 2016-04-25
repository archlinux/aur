# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=halide-bin
pkgver=20160302
pkgrel=1
pkgdesc="A language for image processing and computational photography, precompiled version."
arch=('x86_64')
url="http://halide-lang.org/"
license=('MIT')
depends=('gcc>4.6')
source_i686=("https://github.com/halide/Halide/releases/download/release_2016_03_02/halide-linux-32-gcc53-trunk-65bbac2967ebd59994e613431fd5236baf8a5829.tgz")
source_x86_64=("https://github.com/halide/Halide/releases/download/release_2016_03_02/halide-linux-64-gcc53-trunk-65bbac2967ebd59994e613431fd5236baf8a5829.tgz")
md5sums_i686=("3ff00841cbaee2b99138ce83ab066fe2")
md5sums_x86_64=("91c7e10fe2f5b44c378c3c94bcb2d790")

package() {
  cd "$srcdir/halide"
  install -Dm755 bin/libHalide.a  "$pkgdir/usr/lib/libHalide.a"
  install -Dm755 bin/libHalide.so "$pkgdir/usr/lib/libHalide.so"
  for i in include/*.h; do
    install -Dm644 $i "$pkgdir/usr/$i"
  done
}


