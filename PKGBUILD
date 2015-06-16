# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>

pkgname=openrdate
pkgver=1.2
pkgrel=3
pkgdesc="Open implementation of rdate."
license=("BSD")
source=("http://downloads.sourceforge.net/project/openrdate/openrdate/${pkgname}-${pkgver}.tar.gz/${pkgname}-${pkgver}.tar.gz")
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="http://sourceforge.net/projects/openrdate/"
sha256sums=('2921fc96d4ca676190d6ffd45fa80e107c1fe12291c0c4f64827c29639863332')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
} 

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install	
}
