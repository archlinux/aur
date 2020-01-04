# Contributor: stefan husmann <stefan-husmann@t-online.de>
pkgname=galaxy2
pkgver=1.5
pkgrel=1
pkgdesc="Stellar Simulation"
url="http://www.kornelix.net/galaxy2/galaxy2.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('a3054abef192e15f398fd978bfe48d2caf5d81c754980d448ad8b76ffad7667a')
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
