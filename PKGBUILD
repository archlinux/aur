# Maintainer: Samadi van Koten <me at vktec dot co dot uk>

pkgname=ircd-hybrid
pkgver=8.2.21
pkgrel=1
pkgdesc='A lightweight, high-performance internet relay chat daemon.'
arch=('i686' 'x86_64')
url='http://www.ircd-hybrid.org/'
license=('GPLv2')
depends=('openssl')
makedepends=()
conflicts=()
provides=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/ircd-hybrid/ircd-hybrid/archive/$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr/ --enable-epoll --sysconfdir=/etc/ircd/
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ft=sh sw=2 ts=2 et

