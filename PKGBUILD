# Maintainer: jjacky
pkgname=donnatella
pkgver=0.3.0
pkgrel=1
pkgdesc="GTK+3 customizable file manager with advanced unique features"
arch=('i686' 'x86_64')
url="http://jjacky.com/donnatella"
license=('GPL3+')
optdepends=('gtk3-donnatella: For some advanced GUI features')
depends=('gtk3')
options=('debug' '!strip')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('8a21cb05c6e6f5807f04e588e2bf38012b4173c33b7055c916c05730e66ee1a6')

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
