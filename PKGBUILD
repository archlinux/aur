# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: pfleidi

pkgname=createtorrent
pkgver=1.1.4
pkgrel=5
pkgdesc="A small and fast command line utility for all Linux and Unix operating systems to create BitTorrent files easily."
url="http://createtorrent.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
source=(http://distfiles.macports.org/createtorrent/$pkgname-$pkgver.tar.gz)
md5sums=('922b18eeec74ea81f22a3392e2680307')
sha1sums=('f96fec9b8e1daa06d180f985f58b6d57a05d262d')

build() {
   cd $srcdir/$pkgname-$pkgver
   LDFLAGS="-lssl -lcrypto -ldl -lz" ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver
   make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
