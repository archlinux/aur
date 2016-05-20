# Maintainer: Martin Hundebøll <martin@hundeboll.net>
pkgname=tio
pkgver=1.9
pkgrel=1
pkgdesc="The simple TTY terminal I/O application"
url="http://tio.github.io/"
arch=('x86_64' 'i686')
license=('GPLv2')
source=("https://github.com/tio/tio/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('3f39a8d12e89cbf906f56d482b7cd14636670ca2d59d5b1219f5c60e0f5331b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
