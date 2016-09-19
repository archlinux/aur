# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=flowgrind
pkgver=0.8.0
pkgrel=1
pkgdesc="TCP Performance Measurement"
arch=("i686" "x86_64")
url="http://www.flowgrind.net"
license=('GPLv2')
depends=(libpcap gsl xmlrpc-c)
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
sha1sums=('75285a2d9f50f13d292e404c8a7837ee55fce09e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
