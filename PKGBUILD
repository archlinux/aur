# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdeflate
pkgver=1.5
pkgrel=1
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression"
arch=('i686' 'x86_64')
url="https://github.com/ebiggers/libdeflate"
license=('MIT')
depends=('glibc')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/ebiggers/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('45b1b2332f443b705c59d06a49be009827291d2c487b076dc8ec2791eff4c711')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
