# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: stefan husmann <stefan-husmann@t-online.de>

pkgname=picpuz
pkgver=3.1
pkgrel=3
pkgdesc="'jigsaw puzzle' program."
arch=('i686' 'x86_64')
url="http://www.kornelix.net/picpuz/picpuz.html"
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('36385282d0dbf84ae30422ddaac0b7e5ea47239118f3e6ceb3cccddf3264d3d7')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() { 
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/picpuz/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
