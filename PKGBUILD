# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=libexif-gtk
pkgver=0.5.0
pkgrel=1
pkgdesc="GTK frontend to the libexif library"
arch=('i686' 'x86_64')
url="http://libexif.sourceforge.net"
license=('GPL')
depends=('libexif' 'gtk2')
options=('!libtool')
source=(https://github.com/libexif/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
md5sums=('2bc72a49531cb86096e9038941ec6bda')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
