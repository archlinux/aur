# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Stunts <f.pinamartins@gmail.com>
pkgname=staden-io_lib
_pkgname=io_lib
pkgver=1.14.11
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="DNA sequence assembly (Gap4) and editing and analysis tools (Spin)"
arch=('i686' 'x86_64')
url="http://staden.sourceforge.net/"
license=('BSD')
depends=('curl')
source=($pkgname-$pkgver.tar.gz::https://github.com/jkbonfield/io_lib/archive/io_lib-$_pkgver.tar.gz)
sha256sums=('317aebf88f5b5d687e8165a68d2ed142f16dd5436fd530a24dbaa4acb5684051')

build() {
  cd "$srcdir/$_pkgname-$_pkgname-$_pkgver"
  aclocal
  autoreconf --install
  ./configure --prefix=/usr
  make CFLAGS=-g 
}

package() {
  cd "$srcdir/$_pkgname-$_pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
}
