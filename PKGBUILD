# Maintainer: jjacky
pkgname=pkgclip
pkgver=1.2.0
pkgrel=1
pkgdesc="Cached Packages Trimmer Utility"
arch=('i686' 'x86_64')
url="http://jjacky.com/pkgclip"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.1')
makedepends=('perl')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5c5b1292c41a24e4633592d5556d246c')

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
