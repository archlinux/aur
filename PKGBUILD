# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=glog
pkgver=0.3.4
pkgrel=3
pkgdesc="C++ implementation of the Google logging module"
arch=('i686' 'x86_64')
url="https://github.com/google/glog"
license=('BSD')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/google/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ce99d58dce74458f7656a68935d7a0c048fa7b4626566a71b7f4e545920ceb10')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  aclocal
  autoconf
  automake -a

  ./configure
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  #make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix="/usr" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
