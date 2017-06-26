# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=halide-bin
pkgver=20170503
_noise="06ace54101cbd656e22243f86cce0a82ba058c3b"
_urldate="2017_05_03"
pkgrel=1
pkgdesc="A language for image processing and computational photography, precompiled version."
arch=('x86_64')
url="http://halide-lang.org/"
license=('MIT')
depends=('gcc>4.6')
# those dates have no relation to the version
source_i686=("https://github.com/halide/Halide/releases/download/release_$_urldate/halide-linux-32-gcc53-trunk-$_noise.tgz")
source_x86_64=("https://github.com/halide/Halide/releases/download/release_$_urldate/halide-linux-64-gcc53-trunk-$_noise.tgz")
md5sums_i686=('a012cd096e0cb8e66bfabcc69c32956d')
md5sums_x86_64=('5faae874b471aea5d3ebe85dbb974dc7')

package() {
  cd "$srcdir/halide"
  install -Dm755 lib/libHalide.a  "$pkgdir/usr/lib/libHalide.a"
  install -Dm755 bin/libHalide.so "$pkgdir/usr/lib/libHalide.so"
  for i in include/*.h; do
    install -Dm644 $i "$pkgdir/usr/$i"
  done
}


