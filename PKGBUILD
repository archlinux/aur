# Maintainer: jjacky
pkgname=statusnotifier
pkgver=0.1.0
pkgrel=1
pkgdesc="Library to use KDE's StatusNotifierItem via GObject"
arch=('i686' 'x86_64')
url="http://jjacky.com/statusnotifier"
license=('GPL3+')
depends=('glib2' 'gtk3' 'gdk-pixbuf2')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('6ce734ee57886ef0da05098bb8c98f5a')

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
