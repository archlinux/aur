# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgname=bamm
pkgver=2.5.0
pkgrel=1
pkgdesc="A program for multimodel inference on speciation and trait evolution https://doi.org/10.1038/ncomms2958"
arch=('x86_64')
url="https://github.com/macroevolution/bamm"
license=('GPL2')
makedepends=('cmake' 'make' 'git')
source=("git+$url.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname
  test -d build || mkdir build
}

build() {
  cd $srcdir/$pkgname
  cd build
  cmake ..
  make
}

package() {
  cd $srcdir/$pkgname
  cd build
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
