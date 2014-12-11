# Maintainer: jjacky
pkgname=donnatella
pkgver=0.3.1
pkgrel=1
pkgdesc="GTK+3 customizable file manager with advanced unique features"
arch=('i686' 'x86_64')
url="http://jjacky.com/donnatella"
license=('GPL3+')
optdepends=('gtk3-donnatella: For some advanced GUI features')
depends=('gtk3')
options=('debug' '!strip')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('1d76bf588e95be7cca9414063533224f7c905d61c2efc88bc91fee411770e9ed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
