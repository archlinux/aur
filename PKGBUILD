# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sortpuz  
pkgver=1.5
pkgrel=3
pkgdesc="Unscramble a square matrix of numbered tiles to put them in order."
url="http://www.kornelix.com/sortpuz"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
conflicts=('fixme')
replaces=('fixme')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('e7582d3ebdaba58d4c1e0f119abf055a1f33f2983d2a379542a85533d829c593')

build() {
  cd $pkgname
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  LDFLAGS="-lpthread" make PREFIX=/usr 
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
