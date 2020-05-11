# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=adplug
pkgver=2.3.2
pkgrel=1
pkgdesc="AdLib sound player library"
arch=('i686' 'x86_64')
url="http://adplug.github.io/"
license=('LGPL')
depends=('libbinio')
source=(https://github.com/adplug/adplug/releases/download/adplug-$pkgver/adplug-$pkgver.tar.bz2)
md5sums=('39789aad76eb3f469b1be30fdc65709e')

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
