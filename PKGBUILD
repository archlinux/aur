# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mystuff
pkgver=3.1
pkgrel=8
pkgdesc="Create a custom menu in a popup window"
url="http://www.kornelix.net/mystuff/mystuff.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('112cb3788d0730867cad55295d5129e046f0cf29bcb634de87f5f50fc09b1cc2')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr ICONDIR=/usr/share/pixmaps
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install 
}
