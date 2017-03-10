# Maintainer: jjacky
pkgname=statusnotifier
pkgver=1.0.0
pkgrel=1
pkgdesc="Library to use KDE's StatusNotifierItem via GObject"
arch=('i686' 'x86_64')
url="https://jjacky.com/statusnotifier"
license=('GPL3+')
depends=('glib2' 'gtk3' 'gdk-pixbuf2')
source=(https://jjacky.com/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('d7f169355755e0da250a49919b3df2f4cb6a220606fcb6b1bd2e1e60afbcef9a')

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
