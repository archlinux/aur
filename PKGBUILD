# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>

pkgname=zbar-headless
pkgver=0.10
pkgrel=1
pkgdesc="Application and library for reading bar codes from various sources (headless version)"
arch=('i686' 'x86_64')
url="http://zbar.sourceforge.net/"
license=('LGPL')
depends=('imagemagick' 'python2')
conflicts=('zbar-gtk' 'zbar-qt' 'zbar')
provides=("zbar=$pkgver")
source=("http://downloads.sourceforge.net/project/zbar/zbar/$pkgver/zbar-$pkgver.tar.bz2")

build() {
  cd "$srcdir/zbar-$pkgver"
  # Video disabled: package requires the now-deprecated video4linux version 1
  ./configure --prefix=/usr --without-qt --without-gtk --disable-video CFLAGS=-DNDEBUG
  make
}
package() {
  cd "$srcdir/zbar-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('0fd61eb590ac1bab62a77913c8b086a5')
