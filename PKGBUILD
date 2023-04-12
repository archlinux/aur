# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=swfdec-mozilla-xembed
pkgver=0.9.2
pkgrel=4
pkgdesc="Simplified version of swfdec-mozilla that works in Chromium"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=("swfdec>=$pkgver")
makedepends=("nspr")
source=($pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  CFLAGS="-fPIC" make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

sha256sums=('10158b51e723585de5c0bcd7a2f339d391cdf60869beb293d891635e41d5581a')
