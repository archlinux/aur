# $Id: PKGBUILD 162811 2016-02-20 15:24:54Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=backtrace
pkgver=1.0
pkgrel=1
pkgdesc='C library that may be linked into a C or C++ program to produce symbolic backtraces'
arch=('x86_64' 'i686')
url='https://github.com/ianlancetaylor/libbacktrace'
license=('BSD')
source=('backtrace.pc' "git://github.com/ianlancetaylor/libbacktrace#commit=ba79a27")
md5sums=('2487a9df01f61894bad455138cfd81d3'
         'SKIP')

build() {
  cd "lib$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "lib$pkgname"

  make DESTDIR="$pkgdir" install

  install -Dm644 ../backtrace.pc "$pkgdir/usr/lib/pkgconfig/backtrace.pc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
