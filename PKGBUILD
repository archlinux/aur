# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=4.3
pkgrel=3
arch=('i686' 'x86_64')
makedepends=('xdg-utils')
depends=('libappindicator-gtk3')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.com/watsup"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('51f2ffa4c7e196b6a58af25716e0eef009036225f997a6b70f83f7505ea81b4c')
options=('!emptydirs')

build() {
  cd $pkgname
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make PREFIX=/usr 
}

package() { 
  cd $pkgname
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR="$pkgdir" install
}
