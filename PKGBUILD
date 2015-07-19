# Maintainer: Martin Hundebøll <martin@hundeboll.net>
pkgname=gotty
pkgver=1.2
pkgrel=1
pkgdesc="Go TTY - The Really Simple TTY Terminal Application"
url="http://gotty.io"
arch=('x86_64' 'i686')
license=('GPLv2')
source=("https://github.com/gotty/gotty/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=("78b5341e0fde2747dad05ebecf04e11d19b2a9984029418d594ae381caf0ec32")

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
