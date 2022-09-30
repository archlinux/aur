# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cimfomfa
pkgver=21.341
pkgrel=1
pkgdesc='C utility library for zoem programming language'
arch=(x86_64)
url='https://micans.org/cimfomfa/'
license=(GPL2)
source=("https://micans.org/$pkgname/src/$pkgname-${pkgver/./-}.tar.gz")
sha256sums=('7c25d8af8a9aa208cc745be3712e486dbf47c0786ec6c00ce68a95497f31fff0')

build() {
  cd "$pkgname-${pkgver/./-}"
#  export LDFLAGS="$LDFLAGS -Wl,--allow-multiple-definition"
#  export CFLAGS="$CFLAGS -march=x86-64 -std=c11 -w"
#  export CXXFLAGS="$CXXFLAGS -march=x86-64 -std=c++14 -w"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-${pkgver/./-}" install DESTDIR="$pkgdir"
}
