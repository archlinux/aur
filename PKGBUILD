# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=clockthrottle
pkgver=1.9
pkgrel=2
pkgdesc="Utility program to adjust the max. CPU clock speed"
url="https://kornelix.net/$pkgname/$pkgname.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk' 'powerstat' 'cpupower')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('f43dced1f9320dbc1e59011c0429fa85fee67208472f63f65f0959af416b74d6')
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
