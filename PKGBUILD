# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=flowgrind
pkgver=0.7.5
pkgrel=2
pkgdesc="TCP Performance Measurement"
arch=("i686" "x86_64")
url="http://www.flowgrind.net"
license=('GPLv2')
depends=(libpcap gsl xmlrpc-c)
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2"
        "https://github.com/$pkgname/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2.asc")
md5sums=('4288bcf10c4819e6830e915a40fac056'
         'SKIP')

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
