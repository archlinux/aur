# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=6.0
pkgrel=2
arch=('i686' 'x86_64')
depends=('libappindicator-gtk3' 'clutter-gtk')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.net/watsup/watsup.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('0fdcb60f7d638f3cb4679ea3a7655bb12e0271bf609c83cbd0ff7561a65810ea')
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
