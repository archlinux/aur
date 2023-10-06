# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libcutl
pkgver=1.10.0
pkgrel=1
pkgdesc='A C++ utility library'
arch=(x86_64)
url='https://www.codesynthesis.com/projects/libcutl/'
license=(MIT)
makedepends=()
depends=(gcc-libs
         glibc)
source=(https://www.codesynthesis.com/download/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.gz)
sha256sums=('bdee4b10ce621f18ec91e9ba63d539a2d74542a1d443e0e3f819861ab689d2f6')

build() {
  cd $pkgname-$pkgver
  CXXFLAGS+=" -std=c++14" \
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
