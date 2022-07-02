# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=6.0
pkgrel=3
arch=('i686' 'x86_64')
depends=('libappindicator-gtk3' 'clutter-gtk')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.net/watsup/watsup.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('5c4de1d8e2da53ab30c998ad423f789fc338503f5e11e255c902ac029dbbc988')
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
