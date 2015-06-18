# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
# Contributor: Sean Bolton <smbolton at jps dot net>
pkgname=ghostess
pkgver=20120105
pkgrel=1
pkgdesc="a simple GTK host for DSSI plugins"
arch=('i686' 'x86_64')
url="http://www.smbolton.com/linux.html"
license=('GPL')
depends=('gtk2' 'liblo' 'jack')
makedepends=('dssi')
source=(http://www.smbolton.com/linux/$pkgname-$pkgver.tar.bz2)
md5sums=('15bdcb0d4d3c68507f67d83e4bd3fe6a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix="$pkgdir/usr" --with-jackmidi
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}

# vim:set ts=2 sw=2 et:
