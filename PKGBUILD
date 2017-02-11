# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=halide-bin
pkgver=20161022
_noise="aa5d5514f179bf0ffe1a2dead0c0eb7300b4069a"
pkgrel=1
pkgdesc="A language for image processing and computational photography, precompiled version."
arch=('x86_64')
url="http://halide-lang.org/"
license=('MIT')
depends=('gcc>4.6')
# those dates have no relation to the version
source_i686=("https://github.com/halide/Halide/releases/download/release_2016_10_25/halide-linux-32-gcc53-trunk-$_noise.tgz")
source_x86_64=("https://github.com/halide/Halide/releases/download/release_2016_10_25/halide-linux-64-gcc53-trunk-$_noise.tgz")
md5sums_i686=('7c4a082fea4eae132413a193db82c822')
md5sums_x86_64=('13ba872aeae5e94a7e5631dd04f08211')

package() {
  cd "$srcdir/halide"
  install -Dm755 lib/libHalide.a  "$pkgdir/usr/lib/libHalide.a"
  install -Dm755 bin/libHalide.so "$pkgdir/usr/lib/libHalide.so"
  for i in include/*.h; do
    install -Dm644 $i "$pkgdir/usr/$i"
  done
}


