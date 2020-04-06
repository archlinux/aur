# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=clockthrottle
pkgver=1.2
pkgrel=1
pkgdesc="Utility program to adjust the max. CPU clock speed"
url="https://kornelix.net/$pkgname/$pkgname.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'powerstat' 'cpupower')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('87625220de4d529f445b5545ca30fd512ce45d7d9f8f50012c62c7bbd40dc844')
options=('!emptydirs')

build() {
  cd $pkgname
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  PREFIX=/usr make
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/applications
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
}
