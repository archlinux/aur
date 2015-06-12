# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=turnserver
pkgver=0.7.2
pkgrel=1
pkgdesc="TURN server"
arch=(i686 x86_64)
url="http://turnserver.sourceforge.net/"
license=('GPL')
depends=('confuse' 'openssl')
source=(http://downloads.sourceforge.net/project/turnserver/$pkgname-$pkgver.tar.bz2)
md5sums=('47aeea6e1e0af56cde904673249b6931')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS="-Wno-error -D_GNU_SOURCE"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
