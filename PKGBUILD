# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cpuclock
pkgver=2.0
pkgrel=1
pkgdesc="Utility program to adjust the max. CPU clock speed"
url="https://kornelix.net/$pkgname/$pkgname.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk' 'powerstat' 'cpupower')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('016bf24af65f64a103d1355513af2e07a505886ff6e12490b2231cbc14e41154')
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
