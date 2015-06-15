# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=libjio
pkgver=1.02
pkgrel=1
pkgdesc="A userspace library to do journaled, transaction-oriented I/O."
arch=('i686' 'x86_64')
url="https://blitiri.com.ar/p/libjio/"
license=('custom')
source=("https://blitiri.com.ar/p/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('b9ad3f5e0cef17632aea0f0de9347225')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX="$pkgdir/usr" install
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
