# Maintainer: jjacky
pkgname=pkgclip
pkgver=1.3.0
pkgrel=1
pkgdesc="Cached Packages Trimmer Utility"
arch=('i686' 'x86_64')
url="http://jjacky.com/pkgclip"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman')
makedepends=('perl')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('39e6690ed8f8e70723a5831834579bfe6a597065')

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
