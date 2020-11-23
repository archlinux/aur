# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=4.6
pkgrel=1
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('15065bb61fd3d4ea0ed693b4cc312226a7a25a5659207ee532fcc5456c1ba5a8')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install
  chmod 755 "$pkgdir"/usr/bin/$pkgname
  sed -i 's+/usr/share/lbench/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
