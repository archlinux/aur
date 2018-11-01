# Maintainer: zhangjun (zhangjunphy AT gmail DOT com)

pkgname=libcuba
pkgver=4.2
pkgrel=1
pkgdesc='A library for mutidimensional numerical integration'
arch=('any')
url="http://www.feynarts.de/cuba/"
license=('LGPL')
makedepends=('make' 'automake' 'gcc')
source=("http://www.feynarts.de/cuba/Cuba-$pkgver.tar.gz")
md5sums=('f9ef09cb7d1771f46dd21cd8b8346356')

build() {
  cd "$srcdir/Cuba-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/Cuba-$pkgver"
  make -k check
}

package() {
  cd "$pkgdir"
  install -Dm 644 "$srcdir/Cuba-$pkgver/cuba.pdf" usr/share/doc/cuba/cuba.pdf
  install -Dm 644 "$srcdir/Cuba-$pkgver/libcuba.a" usr/lib/libcuba.a
  install -Dm 644 "$srcdir/Cuba-$pkgver/cuba.h" usr/include/cuba.h
}
