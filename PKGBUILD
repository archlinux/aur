# Maintainer: Simon Perry <pezz at sanxion dot net>
# Contributor: Daniele Paolella <dp@hostess-promoter.com>
pkgname=tmpwatch
pkgver=2.11
pkgrel=2
pkgdesc="Removes files which haven't been accessed for a period of time"
arch=('i686' 'x86_64')
url="http://fedorahosted.org/tmpwatch/"
license=('GPL2')
depends=('glibc')
install=${pkgname}.install
source=("https://fedorahosted.org/releases/t/m/tmpwatch/tmpwatch-$pkgver.tar.bz2")
sha256sums=('93168112b2515bc4c7117e8113b8d91e06b79550d2194d62a0c174fe6c2aa8d4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
