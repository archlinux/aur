# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@gmail.com>
pkgname=libtsm
pkgver=3
pkgrel=3
pkgdesc='Terminal-emulator State Machine'
arch=('x86_64')
url="http://www.freedesktop.org/wiki/Software/kmscon/$pkgname"
license=('MIT')
depends=(glibc)
makedepends=('libxkbcommon')
options=(!libtool)
source=(http://www.freedesktop.org/software/kmscon/releases/$pkgname-$pkgver.tar.xz)
md5sums=('c1b297a69d11a72f207ec35ae5ce7d69')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  make DESTDIR="$pkgdir" install
}
