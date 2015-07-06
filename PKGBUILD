# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=loopdub
pkgver=0.4
pkgrel=1
pkgdesc="A cross-platform audio application for live loop manipulation."
arch=('i686' 'x86_64')
url="http://loopdub.sourceforge.net/"
license=('GPL')
depends=('jack' 'sdl')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('63b3c40753fda27c27cfa945686d2a40')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
