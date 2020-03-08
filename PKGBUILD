# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=4.6
pkgrel=2
arch=('i686' 'x86_64')
makedepends=('xdg-utils')
depends=('libappindicator-gtk3')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.com/watsup"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('d2d2c69e8737d4a3b383a98114e841b75e4473d3bbc10914423edde76335336e')
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
