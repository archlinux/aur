# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=libexif-gtk
pkgver=0.4.0
pkgrel=2
pkgdesc="GTK frontend to the libexif library"
arch=('i686' 'x86_64')
url="http://libexif.sourceforge.net"
license=('GPL')
depends=('libexif' 'gtk2')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/libexif/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('777fe42272a3ef49fb65a4b62109731c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
