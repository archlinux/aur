# Maintainer: jjacky
pkgname=journal-triggerd
pkgver=0.1.0
pkgrel=1
pkgdesc="Runs trigger on journal messages"
arch=('i686' 'x86_64')
url="http://jjacky.com/journal-triggerd"
license=('GPL3+')
depends=('systemd' 'glib2')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b20213df183e681f378e3f87b4c9acc2')

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
