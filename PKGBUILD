# Maintainer: jjacky
pkgname=journal-triggerd
pkgver=0.2.1
pkgrel=1
pkgdesc="Runs trigger on journal messages"
arch=('i686' 'x86_64')
url="http://jjacky.com/journal-triggerd"
license=('GPL3+')
depends=('systemd' 'glib2')
makedepends=('perl' 'groff')
source=(https://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e2412f709dbcefa1473ae29e57269336')

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
