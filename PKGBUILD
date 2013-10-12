# Maintainer: jjacky
pkgname=journal-triggerd
pkgver=0.2.0
pkgrel=1
pkgdesc="Runs trigger on journal messages"
arch=('i686' 'x86_64')
url="http://jjacky.com/journal-triggerd"
license=('GPL3+')
depends=('systemd' 'glib2')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c6c964a423ed5dbdbf21d95a85194138')

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
