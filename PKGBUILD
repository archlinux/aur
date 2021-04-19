# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=countly-cpp
pkgver=17.10
pkgrel=1
pkgdesc="Lightweight C++ library for Countly"
arch=('i686' 'x86_64')
url="https://github.com/ryuichis/countly-cpp"
license=(Apache2)
depends=()
makedepends=()
source=(https://github.com/ryuichis/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('858b8b0b925110060a9f0a3b5891118d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/lib
  cp -r ./lib/libCountly.a $pkgdir/usr/lib/

  mkdir -p $pkgdir/usr/include
  cp -r ./include/countly $pkgdir/usr/include/
}

# vim:set ts=2 sw=2 et:
