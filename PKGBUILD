# Maintainer: Martin Hundebøll <martin@hundeboll.net>
pkgname=tio
pkgver=1.17
pkgrel=1
pkgdesc="The simple TTY terminal I/O application"
url="http://tio.github.io/"
arch=('x86_64' 'i686')
license=('GPLv2')
source=("https://github.com/tio/tio/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('61a0ad8b7a1d032ad6286677b8eb82eefb89c08e5e703ab986d19cdc1009ac09')

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
