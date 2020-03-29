# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=clockthrottle
pkgver=1.1
pkgrel=2
pkgdesc="Utility program to adjust the max. CPU clock speed"
url="https://kornelix.net/$pkgname/$pkgname.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'powerstat-git' 'cpupower')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('bed5eb3ed352d852940466d0c0fb21b1ae672ade19854a6f4134bbb01c15d29e')
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
