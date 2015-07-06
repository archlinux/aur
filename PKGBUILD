# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=didiwiki
pkgver=0.5
pkgrel=1
pkgdesc="Simple wiki implementation with built-in webserver"
arch=('i686' 'x86_64')
url="http://www.c2.com/cgi/wiki?DidiWiki"
license=('GPL')
source=(http://ftp.us.debian.org/debian/pool/main/d/didiwiki/didiwiki_0.5.orig.tar.gz
        didiwiki.1)
md5sums=('94d5fb06d091804b31658481f23b120f'
         'cd9a8ee1ae5473d334e1208a57afcb6b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm 0644 ../didiwiki.1 $pkgdir/usr/share/man/man1/didiwiki.1
  install -Dm 0644 README $pkgdir/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
