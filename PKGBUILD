# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=liblo-ipv6
pkgver=0.30
pkgrel=1
epoch=1
pkgdesc="A lightweight OSC (Open Sound Control) implementation (with IPv6 support)"
arch=('i686' 'x86_64')
url="http://liblo.sourceforge.net/"
license=('GPL')
depends=('glibc')
provides=('liblo' "liblo=$pkgver")
conflicts=('liblo')
source=("http://downloads.sourceforge.net/liblo/liblo-$pkgver.tar.gz")
md5sums=('fa1a9d45f86fc18fb54019f670ff2262')


build() {
  cd "$srcdir/liblo-$pkgver"

  ./configure --prefix=/usr --enable-ipv6
  make
}

package() {
  cd "$srcdir/liblo-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
