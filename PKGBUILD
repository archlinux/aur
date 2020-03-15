# Contributor: stefan husmann <stefan-husmann@t-online.de>
pkgname=galaxy2
pkgver=1.5
pkgrel=4
pkgdesc="Stellar Simulation"
url="http://www.kornelix.net/galaxy2/galaxy2.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('e362676fbd9f8744ed51816383619d75d34de36db3a47f6bae8a4abf416058ab')
options=('!emptydirs')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install  
  rm "$pkgdir"/usr/share/doc/$pkgname/$pkgname.man
  sed -i 's+/usr/share/galaxy2/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
