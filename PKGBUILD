# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=libxs
pkgver=1.2.0
pkgrel=1
pkgdesc="Fast messaging system built on sockets.  Fork of ZeroMQ, Aka Crossroads IO."
arch=('i686' 'x86_64')
#url="http://www.crossroads.io/"
url="https://github.com/crossroads-io/libxs"
license=('LGPL')
depends=('gcc-libs' 'util-linux')
provides=('zeromq')
conflicts=('zeromq')
#source=(http://download.crossroads.io/$pkgname-$pkgver.tar.gz)
source=(http://ftp.de.debian.org/debian/pool/main/libx/libxs/libxs_1.2.0.orig.tar.gz)
md5sums=('aac1264bb0d03704bd2126419b981fd5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure prefix=/usr --enable-libzmq
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

