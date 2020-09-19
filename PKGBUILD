# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=5.0
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('xdg-utils')
depends=('libappindicator-gtk3')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.com/watsup"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('92702272fa0051387a837e9155be4d9533e373d68f48602c52e1ca9820f6cb81')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr 
}

package() { 
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/watsup/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
