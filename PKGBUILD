# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mystuff
pkgver=3.1
pkgrel=1
pkgdesc="Create a custom menu in a popup window"
url="http://www.kornelix.com/mystuff"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('63eb50580c806006736ce4f8b9d97c97f8506ce8103bf0be2260221ded21376f')

build() {
  cd $pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make PREFIX=/usr LDFLAGS="-lpthread" ICONDIR=/usr/share/pixmaps
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install 
}
