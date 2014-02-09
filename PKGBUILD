# Maintainer: jjacky
pkgname=donnatella
pkgver=0.1.1
pkgrel=1
pkgdesc="GTK+3 customizable file manager with advanced unique features"
arch=('i686' 'x86_64')
url="http://jjacky.com/donnatella"
license=('GPL3+')
optdepends=('gtk3-donnatella: For some advanced GUI features')
depends=('gtk3')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f9bc605592cdfd114fd7fbaa9561b919')

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
