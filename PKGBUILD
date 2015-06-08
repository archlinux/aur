# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265
pkgver=0.9
pkgrel=1
pkgdesc="Open h.265 video codec implementation"
arch=('i686' 'x86_64')
url="https://github.com/strukturag/libde265"
license=('LGPL3')
depends=( "glibc" 'sdl' )
makedepends=( )
source=( "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" )
sha1sums=('c06ae7a134ae8d71b5da8debf1a7f9bd7a9ee823')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  find "$pkgdir" -name "*.la" -delete
}
